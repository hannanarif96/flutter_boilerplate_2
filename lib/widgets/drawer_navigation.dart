import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/helpers/custom_colors.dart';
import 'package:get/get.dart';

class DrawerNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(color: CustomColors.colorSecondary),
          child: Center(
            child: Image.asset(
              'lib/assets/images/company_logo.png',
              fit: BoxFit.fitHeight,
              height: 120.0,
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: ListView(
              shrinkWrap: true,
              children:
                  ListTile.divideTiles(color: CustomColors.colorMain, tiles: [
                ListTile(
                  leading: Icon(Icons.home),
                  minLeadingWidth: 50.0,
                  title: Text('Home '),
                  onTap: () {
                    Get.offAllNamed("/");
                  },
                ),
              ]).toList(),
            ),
          ),
        ),
      ]),
    );
  }
}
