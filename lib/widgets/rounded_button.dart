import 'package:flutter/material.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/size_config.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.label, this.onPressed})
      : assert(label != null, onPressed != null);

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: SizeConfig.screenWidth,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: RaisedButton(
        color: kDarkGreen,
        child: Text(label, style: TextStyle(color: Colors.white)),
        onPressed: onPressed,
      ),
    );
  }
}
