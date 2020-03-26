import 'package:flutter/material.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/size_config.dart';

class IconItem extends StatelessWidget {
  IconItem(this.bikeItem);

  final BikeItem bikeItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Icon(Icons.location_on, size: SizeConfig.safeBlockHorizontal * 5),
        ),
        Text(bikeItem.location, softWrap: true)
      ],
    );
  }
}
