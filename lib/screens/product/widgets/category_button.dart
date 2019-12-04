import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/bloc/product_bloc.dart';
import 'package:plant_shop/screens/product/enums/categories_enum.dart';

class CategoryButton extends StatefulWidget {

  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 4),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          childAspectRatio: .2,
        ),
        itemCount: categories_enum.length,
        itemBuilder: (context, index) => FlatButton(
              onPressed: () {
                setState(() {
                  _selected = index;
                });
                BlocProvider.getBloc<ProductBloc>().search.add(categories_enum[index]);
              },
              child: Text(
                categories_enum[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: _selected == index ? 15 : 14,
                    fontWeight: _selected == index ? FontWeight.bold : null,
                    color: _selected == index ? Colors.black : Colors.grey),
              ),
            )
            );
  }
}
