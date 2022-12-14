import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:evrika_retail/config/evrika_colors.dart';
import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/state/loading.dart';
import 'package:evrika_retail/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';
import '../state/orderx.dart';
import '../utils/http_client.dart';
import '../consts.dart';
import '../state/categories.dart';

class CategorySearchScreen extends StatelessWidget {
  const CategorySearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context, listen: false);
    final loading = Provider.of<Loading>(context, listen: false);
    final order = Provider.of<OrderX>(context, listen: false);
    categories.deleteCategoryFromBreadCrumb(0);
    //final auth = Provider.of<Auth>(context, listen: false);
    print('cats type: ' + categories.breadcrumbs.runtimeType.toString());
    Map<int, String> catsMap = categories.breadcrumbs.asMap();
    print('cats map type: ' + catsMap.runtimeType.toString());
    // print('length: ' + categories
    //     .steps[categories.currentStep]!.length!.toString());
    ScrollController controller = ScrollController();
    return Scaffold(
      appBar: appBarWithBackBtn(context, 'Поиск по категориям'),
      body: Observer(builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              categories.breadcrumbs.length > 1
                  ? Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: SizedBox(
                            height: 30,
                            child: ListView(
                                physics: BouncingScrollPhysics(),
                                controller: controller,
                                dragStartBehavior: DragStartBehavior.down,
                                // direction: Axis.horizontal,
                                // spacing: 2,
                                // runSpacing: 5,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  for (var i in categories.breadcrumbs)
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(horizontal: 4),
                                        //   child: Text('/', style: EvrikaTextStyles.primaryS15W400,),
                                        // ),
                                        categories.breadcrumbs.indexOf(i) != 0
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4),
                                                child: SvgPicture.asset(
                                                  '$kAssetIcons/arrow_right.svg',
                                                  width: 5,
                                                  height: 10,
                                                  color: EvrikaColors
                                                      .kPrimaryColor,
                                                ),
                                              )
                                            : Container(),
                                        InkWell(
                                          onTap: () {
                                            print(categories
                                                .steps[1]?.first.name);
                                            categories
                                                .deleteCategoryFromBreadCrumb(
                                                    categories.breadcrumbs
                                                        .indexOf(i));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(7),
                                            decoration: BoxDecoration(
                                                color: categories.breadcrumbs
                                                            .indexOf(i) ==
                                                        (categories.currentStep -
                                                            1)
                                                    ? EvrikaColors.kPrimaryColor
                                                    : Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                                border: Border.all(
                                                    color: categories
                                                                .breadcrumbs
                                                                .indexOf(i) ==
                                                            (categories
                                                                    .currentStep -
                                                                1)
                                                        ? Colors.white
                                                        : EvrikaColors
                                                            .kPrimaryColor,
                                                    width: 1)),
                                            child: Text(
                                              i,
                                              style: categories.breadcrumbs
                                                          .indexOf(i) ==
                                                      (categories.currentStep -
                                                          1)
                                                  ? EvrikaTextStyles
                                                      .whiteS12W500
                                                  : EvrikaTextStyles
                                                      .labelGrayS12W400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ]),
                          ),
                        ),
                        // ListView.builder(
                        // //  scrollDirection: Axis.horizontal,
                        //   controller: controller,
                        //   shrinkWrap: true,
                        //   physics: NeverScrollableScrollPhysics(),
                        //   itemCount: 100,
                        //   itemBuilder: (context, index) => Text(
                        //     index.toString(),
                        //   ),
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    )
                  : Container(),
              !categories.isLastStep
                  ? Expanded(
                      child: SingleChildScrollView(
                        child: GridView.builder(
                            //  childAspectRatio: 3/2,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              crossAxisCount: 2,
                              childAspectRatio: (0.9),
                            ),
                            itemCount: categories
                                .steps[categories.currentStep]?.length,
                            itemBuilder: (ctx, index) {
                              return InkWell(
                                onTap: () async {
                                  bool isEmpty = categories
                                          .steps[categories.currentStep]![index]
                                          .children
                                          ?.isNotEmpty ??
                                      false;
                                  if (!isEmpty) {
                                    loading.setLoading(true);
                                    categories.emptyItemList();
                                    categories.itIsLastStep();

                                    var byId = await HttpClient.getCategoryById(
                                        categories
                                            .steps[categories.currentStep]![
                                                index]
                                            .id
                                            .toString());
                                    List<dynamic> fromJson = jsonDecode(byId);
                                    for (var i in fromJson) {
                                      categories.addItem(Item.fromJson(
                                          fromJson[fromJson.indexOf(i)]));
                                    }
                                    print('fromJson ' +
                                        fromJson.runtimeType.toString());
                                    print(categories.itemsFromCategory);
                                    print('if was called');
                                    loading.setLoading(false);
                                  }
                                  // if (isEmpty) {
                                  if (controller.hasClients)
                                    controller.jumpTo(500);
                                  categories.addToCategory(
                                      categories.currentStep + 1,
                                      categories.steps[categories.currentStep]![
                                          index]);
                                  // }
                                  // else {
                                  //   print(categories
                                  //       .steps[categories.currentStep]![index].id);
                                  //   SharedPreferences sp =
                                  //       await SharedPreferences.getInstance();
                                  //   String? token = await sp.getString('accessToken');
                                  //   var byId = await HttpClient.getCategoryById(
                                  //       token!,
                                  //       categories
                                  //           .steps[categories.currentStep]![index].id
                                  //           .toString());
                                  //   print('by ID: ' + byId);
                                  // }
                                },
                                child: Container(
                                  // height: 121,
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: EvrikaColors.boxShadowColor,
                                          spreadRadius: 0.5,
                                          blurRadius: 1,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7)),
                                      color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: categories
                                            .steps[categories.currentStep]![
                                                index]
                                            .photo!,
                                        fit: BoxFit.fill,
                                        height: 90,
                                        width: 90,
                                        placeholder: (context, url) => SizedBox(
                                          height: 100,
                                          width: double.infinity,
                                          child: SizedBox(
                                            height: 16,
                                            width: 16,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.grey[100],
                                              ),
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 15),
                                          child: Placeholder(
                                            fallbackWidth: 30,
                                            fallbackHeight: 30,
                                            color: EvrikaColors.kPrimaryColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Text(
                                            categories
                                                .steps[categories.currentStep]![
                                                    index]
                                                .name!,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: EvrikaTextStyles.darkS15W500,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  : loading.isLoading
                      ? Expanded(
                          child: Center(child: CircularProgressIndicator()))
                      : Expanded(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                              itemCount: categories.itemsFromCategory.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 7),
                                  child: Container(
                                    height: 70,
                                    // padding: EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 0),
                                    decoration: BoxDecoration(
                                        color: EvrikaColors.boxShadowColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7))),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15,
                                                top: 15,
                                                bottom: 15,
                                                right: 0),
                                            child: Text(
                                              categories
                                                  .itemsFromCategory![index]
                                                  .attributes!
                                                  .fullName!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ),
                                        // Spacer(),
                                        TextButton(
                                          onPressed: () {
                                            print('i was tapped');
                                            categories.deleteCategoryFromBreadCrumb(0);
                                            order.addItem(categories
                                                .itemsFromCategory![index]);
                                            Navigator.pop(context);
                                          },
                                          child: SvgPicture.asset(
                                            '$kAssetIcons/plus.svg',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
            ],
          ),
        );
      }),
    );
  }
}
