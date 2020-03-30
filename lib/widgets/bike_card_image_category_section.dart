
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_coding_task/bloc/barrel.dart';
import 'package:is_coding_task/bloc/bike_shop_bloc.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/widgets/bike_image_section.dart';

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
