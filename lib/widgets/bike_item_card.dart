import 'package:flutter/material.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/screens/detail_screen.dart';
import 'package:is_coding_task/widgets/bike_card_info_item.dart';
import 'package:is_coding_task/widgets/bike_image_section.dart';
import 'package:is_coding_task/widgets/scale_transition_route.dart';
import 'package:is_coding_task/widgets/selectable_card.dart';
import 'package:is_coding_task/widgets/spacer.dart';

class BikeItemCard extends StatelessWidget {
  BikeItemCard(
      {this.bikeItem, this.showCheckbox, this.isSelected, this.onSelect})
      : assert(bikeItem != null);

  final BikeItem bikeItem;
  final bool showCheckbox;
  final bool isSelected;
  final Function(BikeItem) onSelect;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return SelectableCard(
      onSelect: () => onSelect(bikeItem),
      isSelected: isSelected,
      showCheckbox: showCheckbox,
      onTap: () =>
          Navigator.push(context, SizeRoute(page: DetailScreen(bikeItem.id))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BikeImageSection(
            bikeItem: bikeItem,
            imageWidth: media.size.width,
            imageHeight: media.size.height / 5,
          ),
          VerticalSpacer(),
          Text(bikeItem.name, style: kTitleTextStyle),
          VerticalSpacer(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BikeCardInfoItem(
                label: "Location",
                info: bikeItem.location,
              ),
              BikeCardInfoItem(label: "Frame Size", info: bikeItem.frameSize),
            ],
          )
        ],
      ),
    );
  }
}
