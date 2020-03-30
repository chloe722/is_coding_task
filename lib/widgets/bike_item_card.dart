import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_coding_task/bloc/barrel.dart';
import 'package:is_coding_task/bloc/bike_shop_bloc.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/screens/detail_screen.dart';
import 'package:is_coding_task/widgets/bike_image_section.dart';
import 'package:is_coding_task/widgets/size_page_route.dart';
import 'package:is_coding_task/widgets/spacer.dart';

class BikeItemCard extends StatelessWidget {
  BikeItemCard(this.bikeItem): assert(bikeItem != null);

  final BikeItem bikeItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,SizeRoute(page: DetailScreen(bikeItem.id))),
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
                Text(bikeItem.name, style: kTitleTextStyle)
              ],
            )),
      ),
    );
  }
}


class ImageCategorySection extends StatelessWidget {
  ImageCategorySection(this.bikeItem) : assert(bikeItem != null);

  final BikeItem bikeItem;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Stack(
      children: <Widget>[
        BikeImageSection(
          bikeItem: bikeItem,
            imageWidth: media.size.width,
            imageHeight: media.size.height / 5,

        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              BlocProvider.of<BikeShopBloc>(context)
                  .add(DeleteBikeItem(bikeItem));
            },
            icon: Icon(
              Icons.delete_outline,
              size: 35.0,
            ),
          ),
        )
      ],
    );
  }
}
