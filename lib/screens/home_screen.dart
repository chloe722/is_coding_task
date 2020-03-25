import 'package:flutter/material.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/data.dart';
import 'package:is_coding_task/routes.dart';
import 'package:is_coding_task/widgets/bike_item_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.addBikeItem),
        backgroundColor: kDarkGreen,
        child: Icon(Icons.add),
      ),

      body: Center(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: bikes.length,
              itemBuilder: (context, index) => BikeItemCard(bikes[index]))),
    );
  }
}
