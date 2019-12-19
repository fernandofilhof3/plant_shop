import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;
  final String image;


  DrawerTile({this.icon, this.text, this.controller, this.page, this.image});

  @override
  Widget build(BuildContext context) {
    log(controller.page.toString());
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
          padding: EdgeInsets.only(left: 12),
          height: 50,
          child: Row(
            children: <Widget>[
              image == null ? Icon(
                icon,
                size: 28,
                color: controller.page.round() == page ? Theme.of(context).primaryColor : Colors.grey[500],
              ) : SvgPicture.asset(
                        image,
                        width: 36,
                        height: 36,
                        color: controller.page.round() == page ? Theme.of(context).primaryColor : Colors.grey[500]
                      ),
              SizedBox(width: 20),
              Text(text,
              style: TextStyle(
                fontSize: 20,
                // fontWeight: FontWeight.w500,
                color: controller.page.round() == page ? Theme.of(context).primaryColor : Colors.grey[500],
              ),)
            ],
          ),
        ),
      ),
    );
  }
}