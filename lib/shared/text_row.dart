import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextRow extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;

  TextRow({this.icon, this.subtitle, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: SvgPicture.asset(
            icon,
            width: 34,
            height: 34,
            color: Colors.white,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                letterSpacing: 0.8,
              ),
            ),
          ],
        )
      ],
    );
  }
}
