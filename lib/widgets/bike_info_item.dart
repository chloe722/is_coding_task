import 'package:flutter/material.dart';
import 'package:is_coding_task/constants.dart';

class BikeInfoItem extends StatelessWidget {
  BikeInfoItem({@required this.title, @required this.info})
      : assert(title != null, info != null);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child:
                  Text(info, style: kTitleTextStyle.copyWith(fontSize: 16.0)),
            ),
            Text(title, style: TextStyle(color: Colors.grey[600],fontSize: 12.0), softWrap: true),
          ],
        ),
      ),
    );
  }
}
