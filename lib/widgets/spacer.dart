import 'package:flutter/material.dart';

class VerticalSpacer extends StatelessWidget {
  VerticalSpacer({this.height = 16.0});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
