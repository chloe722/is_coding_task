
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/widgets/category_tag.dart';
import 'package:is_coding_task/widgets/center_indicator.dart';

class BikeImageSection extends StatelessWidget {
  BikeImageSection({@required this.bikeItem, this.imageHeight, this.imageWidth}): assert(bikeItem != null);

  final BikeItem bikeItem;
  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: bikeItem.photoUrl,
          placeholder: (context, url) => CenterIndicator(),
          fit: BoxFit.contain,
          height: imageHeight,
          width: imageWidth
        ),
        Align(
          alignment: Alignment.topLeft,
          child: CategoryTag(bikeItem.category)
        ),
      ],
    );
  }
}

