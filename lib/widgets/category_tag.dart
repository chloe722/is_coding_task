import 'package:flutter/material.dart';
import 'package:is_coding_task/constants.dart';

class CategoryTag extends StatelessWidget {
  CategoryTag({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kCustomGreen
      ),
      child: Text(title, style: kCategoryTagTextStyle),
    );
  }
}
