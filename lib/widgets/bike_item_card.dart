import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:is_coding_task/bike_item.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/routes.dart';
import 'package:is_coding_task/screens/detail_screen.dart';

class BikeItemCard extends StatelessWidget {
  BikeItemCard(this.bikeItem);

  final BikeItem bikeItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) => DetailScreen())),
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: bikeItem.photoUrl,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    fit: BoxFit.contain,
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: kCustomGreen
                      ),
                      child: Text(bikeItem.category, style: kCategoryTagTextStyle),
                    ),
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: (){print("delete");},
                      icon: Icon(Icons.delete_outline, size: 35.0,),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(bikeItem.name, style: kTitleTextStyle),
              )
            ],
          )
        ),
      ),
    );
  }
}
