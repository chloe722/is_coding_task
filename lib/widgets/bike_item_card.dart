import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_coding_task/bloc/barrel.dart';
import 'package:is_coding_task/bloc/bike_shop_bloc.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/screens/detail_screen.dart';
import 'package:is_coding_task/widgets/bike_card_image_category_section.dart';
import 'package:is_coding_task/widgets/bike_card_info_item.dart';
import 'package:is_coding_task/widgets/bike_image_section.dart';
import 'package:is_coding_task/widgets/icon_item.dart';
import 'package:is_coding_task/widgets/scale_transition_route.dart';
import 'package:is_coding_task/widgets/spacer.dart';

class BikeItemCard extends StatelessWidget {
  BikeItemCard(this.bikeItem) : assert(bikeItem != null);

  final BikeItem bikeItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, SizeRoute(page: DetailScreen(bikeItem.id))),
      child: Card(
        elevation: 8.0,
        margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ImageCategorySection(bikeItem),
                VerticalSpacer(),
                Text(bikeItem.name, style: kTitleTextStyle),
                VerticalSpacer(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    BikeCardInfoItem(label: "Location",info: bikeItem.location,),
                    BikeCardInfoItem(label: "Frame Size", info: bikeItem.frameSize),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
