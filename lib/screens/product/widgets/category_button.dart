import 'package:flutter/material.dart';
import 'package:plant_shop/models/category_model.dart';

class CategoryButton extends StatefulWidget {
  final Category category;
  final Function onTap;

  CategoryButton(this.category, this.onTap);

  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  Category get _category => widget.category;
  Function get _onTap => widget.onTap;
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
        itemCount: 5,
        itemBuilder: (context, index) => FlatButton(
              onPressed: () {
                setState(() {
                  _selected = index;
                });
                _onTap(_category.id);
              },
              child: Text(
                _category.category,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: _selected == index ? 16 : 15,
                    fontWeight: _selected == index ? FontWeight.bold : null,
                    color: _selected == index ? Colors.black : Colors.grey),
              ),
            ));
  }
}
