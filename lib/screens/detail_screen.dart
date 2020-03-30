import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_coding_task/bloc/barrel.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/screens/edit_add_bike_screen.dart';
import 'package:is_coding_task/strings.dart';
import 'package:is_coding_task/toast_helper.dart';
import 'package:is_coding_task/widgets/spacer.dart';
import 'package:is_coding_task/widgets/bike_image_section.dart';
import 'package:is_coding_task/widgets/bike_info_item.dart';
import 'package:is_coding_task/widgets/icon_item.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(this.bikeId) : assert(bikeId != null);

  final String bikeId;

  void _onSave({BikeItem bikeItemVal, BuildContext contextVal}) {
    BlocProvider.of<BikeShopBloc>(contextVal).add(UpdateBikeItem(bikeItemVal));
    ToastHelper().showToastMsg(msg: kEditBikeInfoSuccessMsg);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);

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
                    onSave: (bikeItemVal) =>
                        _onSave(bikeItemVal: bikeItemVal, contextVal: context)),
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
                    imageWidth: media.size.width,
                    imageHeight: media.size.height / 3),
                IconItemRow(label: bikeItem.location, icon: Icons.location_on),
                VerticalSpacer(),
                Text(bikeItem.name,
                    style: kTitleTextStyle.copyWith(fontSize: 20.0),
                    softWrap: true),
                VerticalSpacer(),
                Text(bikeItem.description, softWrap: true),
                VerticalSpacer(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    BikeInfoItem(
                        title: kBikeFrameSizeLabel, info: bikeItem.frameSize),
                    BikeInfoItem(
                        title: kBikePriceRangeLabel,
                        info: bikeItem.getPriceRange()),
                  ],
                ),
              ],
            )),
      );
    });
  }
}
