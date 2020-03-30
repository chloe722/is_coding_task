import 'package:flutter/material.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/screens/detail_screen.dart';
import 'package:is_coding_task/widgets/bike_card_image_category_section.dart';
import 'package:is_coding_task/widgets/bike_card_info_item.dart';
import 'package:is_coding_task/widgets/scale_transition_route.dart';
import 'package:is_coding_task/widgets/spacer.dart';

class BikeItemCard extends StatelessWidget {
  BikeItemCard({this.bikeItem, this.showCheckbox, this.isSelected, this.onSelect}) : assert(bikeItem != null);

  final BikeItem bikeItem;
  final bool showCheckbox;
  final bool isSelected;
  final Function(bool) onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () => showCheckbox? null: Navigator.push(context, SizeRoute(page: DetailScreen(bikeItem.id))),
            child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ImageCategorySection(bikeItem: bikeItem, toggledDelete: showCheckbox),
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

          ),
          //          toggledDelete?
//         Align(alignment: Alignment.topRight,
//          child: IconButton(
//            onPressed: () {
////              BlocProvider.of<BikeShopBloc>(context)
////                  .add(DeleteBikeItem(bikeItem));
//            },
//            icon: Icon(
//              Icons.delete_outline,
//              size: 35.0,
//            ),
//          ),
//        ) : Container(child: null)

          showCheckbox? Align(
              alignment: Alignment.topRight,
              child: Checkbox(
                checkColor: kDarkGreen,
                onChanged: onSelect,

                value: isSelected,
              )
          ) : Container(child: null)
        ]
      ),
    );
  }
}
