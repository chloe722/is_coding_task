import 'package:flutter/material.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/size_config.dart';
import 'package:is_coding_task/strings.dart';
import 'package:is_coding_task/widgets/spacer.dart';
import 'package:is_coding_task/widgets/bike_image_section.dart';
import 'package:is_coding_task/widgets/bike_info_item.dart';
import 'package:is_coding_task/widgets/icon_item.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(this.bikeItem);

  final BikeItem bikeItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
            color: kDarkGreen,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BikeImageSection(
                  bikeItem: bikeItem,
                  imageWidth: SizeConfig.screenWidth,
                  imageHeight: SizeConfig.screenHeight / 2.5),
              IconItem(bikeItem),
              VerticalSpacer(),
              Text(bikeItem.name,
                  style: kTitleTextStyle.copyWith(fontSize: 25.0),
                  softWrap: true),
              VerticalSpacer(),
              Text(bikeItem.description, softWrap: true),
              VerticalSpacer(),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InfoItem(title: kBikeFrameSizeLabel, info: bikeItem.frameSize),
                  InfoItem(title: kBikePriceRangeLabel, info: bikeItem.priceRange),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

