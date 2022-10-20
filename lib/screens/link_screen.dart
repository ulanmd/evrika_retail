import 'package:evrika_retail/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LinkScreen extends StatelessWidget {
  const LinkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('$kAssetIcons/qr.svg', width: MediaQuery.of(context).size.width*0.6,),
            const SizedBox(height: 10,),
            const Text('Просканируйте чтобы скачать приложение', style: TextStyle(fontSize: 16),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: Divider(
                    indent: 20.0,
                    endIndent: 10.0,
                    thickness: 2,
                  ),
                ),
                Text(
                  "или отправьте ссылку клинету по SMS",
                  style: TextStyle(),
                ),
                Expanded(
                  child: Divider(
                    indent: 10.0,
                    endIndent: 20.0,
                    thickness: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
           ElevatedButton(onPressed: (){}, child: Text('Отправить ссылку'))
          ],
        ),
      ),
    );
  }
}
