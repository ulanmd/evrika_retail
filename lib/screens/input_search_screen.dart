import 'dart:convert';

import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/utils/consts.dart';
import 'package:evrika_retail/config/evrika_colors.dart';
import 'package:evrika_retail/state/input_searchx.dart';
import 'package:evrika_retail/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';
import '../state/loading.dart';
import '../state/orderx.dart';
import '../utils/http_client.dart';

class InputSearchScreen extends StatelessWidget {
  const InputSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading = Provider.of<Loading>(context, listen: false);
    final order = Provider.of<OrderX>(context, listen: false);
    final inputSearchState = InputSearchX();
    final controller = TextEditingController();
    print('isloading ' + loading.isLoading.toString());
    inputSearchState.emptyAddedItems();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithBackBtn(context, 'Поиск товара'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Observer(builder: (_) {
          return Column(
            children: [
              Container(
                height: 47,
                child: TextFormField(
                  textInputAction: TextInputAction.search,
                  controller: controller,
                  onFieldSubmitted: (_) async {
                    loading.setLoading(true);
                    print('you clicked me');
                    var byId =
                    await HttpClient.getCategoryByText(controller.text);
                    List<dynamic> fromJson = jsonDecode(byId.body);
                    for (var i in fromJson) {
                      inputSearchState.addItem(
                          Item.fromJson(fromJson[fromJson.indexOf(i)]));
                    }
                    loading.setLoading(false);
                  },
                  decoration: InputDecoration(
                    hintText: 'Введите название товара...',
                    suffixIcon: IconButton(
                      onPressed: !loading.isLoading ? () async {
                        loading.setLoading(true);
                        print('you clicked me');
                        var byId =
                            await HttpClient.getCategoryByText(controller.text);
                        List<dynamic> fromJson = jsonDecode(byId.body);
                        for (var i in fromJson) {
                          inputSearchState.addItem(
                              Item.fromJson(fromJson[fromJson.indexOf(i)]));
                        }
                        loading.setLoading(false);
                      }: null,
                      icon: SvgPicture.asset('$kAssetIcons/search.svg', color: loading.isLoading ? EvrikaColors.lightBlue : EvrikaColors.kPrimaryColor,),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              !loading.isLoading
                  ? Expanded(
                      child: inputSearchState.loadedItems.length > 0
                          ? ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: inputSearchState.loadedItems.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 7),
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: EvrikaColors.boxShadowColor,
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              inputSearchState
                                                      .loadedItems[index]
                                                      .attributes
                                                      ?.fullName ??
                                                  '',
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  EvrikaTextStyles.darkS13W500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          TextButton(
                                            onPressed: (){
                                              print('i was tapped');
                                              order.addItem(inputSearchState
                                                  .loadedItems[index]);
                                              Navigator.pop(context);
                                            },
                                            child: SvgPicture.asset(
                                                '$kAssetIcons/plus.svg'),
                                          )
                                        ],
                                      ),
                                    ));
                              })
                          : Container(),
                    )
                  : Expanded(child: Center(child: CircularProgressIndicator())),
            ],
          );
        }),
      ),
    );
  }
}
