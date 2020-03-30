import 'package:flutter/material.dart';
import 'package:is_coding_task/constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.label, this.onPressed, this.key})
      : assert(label != null, onPressed != null), super(key: key);

  final String label;
  final Key key;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: RaisedButton(
        color: kDarkGreen,
        child: Text(label, style: TextStyle(color: Colors.white)),
        onPressed: onPressed,
      ),
    );
  }
}
