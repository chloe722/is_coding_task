import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_coding_task/bloc/barrel.dart';
import 'package:is_coding_task/routes.dart';
import 'package:is_coding_task/widgets/bike_item_card.dart';
import 'package:is_coding_task/widgets/center_indicator.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Routes.addBikeItem),
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<BikeShopBloc, BikeShopState>(
        builder: (context, state) {
          if (state is BikeShopLoading) {
            return CenterIndicator();
          } else if (state is BikeShopLoaded) {
            return Center(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.bikes.length,
                      itemBuilder: (context, index) => BikeItemCard(
                            state.bikes[index],
                          )));
          } else {
            return Container(child: null);
          }
        },
      ),
    );
  }
}
