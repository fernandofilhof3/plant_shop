import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
   final IconData icon;
  final String text;
  final PageController controller;
    final int page;


  DrawerTile({this.icon, this.text, this.controller, this.page});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(left: 10),
          height: 50,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 28,
                color: controller.page.round() == page ? Theme.of(context).primaryColor : Colors.grey[500],
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