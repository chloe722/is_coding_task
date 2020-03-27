import 'package:flutter/material.dart';
import 'package:is_coding_task/size_config.dart';

class IconItemRow extends StatelessWidget {
  IconItemRow({@required this.label, @required this.icon})
      : assert(label != null, icon != null);

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Icon(icon, size: SizeConfig.safeBlockHorizontal * 5),
        ),
        Text(label, softWrap: true)
      ],
    );
  }
}