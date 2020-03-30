
import 'package:flutter/material.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/widgets/spacer.dart';

class BikeCardInfoItem extends StatelessWidget {
  BikeCardInfoItem({@required this.info, @required this.label});

  final String info;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(info,style: TextStyle(color: kDarkGreen)),
          VerticalSpacer(height: 8.0),
          Text(label, style: TextStyle(color: Colors.grey, fontSize: 12.0),)
        ],
      ),
    );
  }
}