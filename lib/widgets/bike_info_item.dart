import 'package:flutter/material.dart';
import 'package:is_coding_task/constants.dart';

class InfoItem extends StatelessWidget {
  InfoItem({this.title, this.info});

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
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
              Text(info, style: kTitleTextStyle.copyWith(fontSize: 20.0)),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
