import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.label, this.onPressed, this.key, this.color})
      : assert(label != null, onPressed != null),
        super(key: key,);

  final String label;
  final Key key;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: RaisedButton(
        color: color,
        child: Text(label, style: TextStyle(color: Colors.white)),
        onPressed: onPressed,
      ),
    );
  }
}
