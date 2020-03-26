import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_coding_task/bloc/barrel.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/screens/edit_add_bike_screen.dart';
import 'package:is_coding_task/size_config.dart';
import 'package:is_coding_task/strings.dart';
import 'package:is_coding_task/widgets/spacer.dart';
import 'package:is_coding_task/widgets/bike_image_section.dart';
import 'package:is_coding_task/widgets/bike_info_item.dart';
import 'package:is_coding_task/widgets/icon_item.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(this.bikeId) : assert(bikeId != null);

  final String bikeId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BikeShopBloc, BikeShopState>(builder: (context, state) {
      final bikeItem = (state as BikeShopLoaded)
          .bikes
          .firstWhere((bike) => bike.id == bikeId, orElse: () => null);
      return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditAddScreen(
                    bikeItem: bikeItem,
                    isEditing: true,
                    onSave: (bikeItemVal) {
                      BlocProvider.of<BikeShopBloc>(context).add(UpdateBikeItem(
                        bikeItem.copyWith(
                            name: bikeItemVal.name,
                            category: bikeItemVal.category,
                            location: bikeItemVal.location,
                            frameSize: bikeItemVal.frameSize,
                            priceRange: bikeItemVal.priceRange,
                            description: bikeItemVal.description,
                            photoUrl: bikeItemVal.photoUrl),
                      ));
                    }),
              )),
              color: kDarkGreen,
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    InfoItem(
                        title: kBikeFrameSizeLabel, info: bikeItem.frameSize),
                    InfoItem(
                        title: kBikePriceRangeLabel, info: bikeItem.priceRange),
                  ],
                ),
              ],
            )),
      );
    });
  }
}
