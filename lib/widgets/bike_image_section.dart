
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/widgets/category_tag.dart';

class BikeImageSection extends StatelessWidget {
  BikeImageSection({this.bikeItem, this.imageHeight, this.imageWidth});

  final BikeItem bikeItem;
  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: bikeItem.photoUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          fit: BoxFit.contain,
          height: imageHeight,
          width: imageWidth
        ),
        Align(
          alignment: Alignment.topLeft,
          child: CategoryTag(title: bikeItem.category)
        ),
      ],
    );
  }
}

