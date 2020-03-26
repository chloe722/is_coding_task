import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_coding_task/bloc/barrel.dart';
import 'package:is_coding_task/routes.dart';
import 'package:is_coding_task/size_config.dart';
import 'package:is_coding_task/widgets/bike_item_card.dart';
import 'package:is_coding_task/widgets/center_indicator.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<BikeShopBloc, BikeShopState>(
      builder: (context, state) {
        if (state is BikeShopLoading) {
          return CenterIndicator();
        } else if (state is BikeShopLoaded) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, Routes.addBikeItem),
              child: Icon(Icons.add),
            ),
            body: Center(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.bikes.length,
                    itemBuilder: (context, index) => BikeItemCard(
                          bikeItem: state.bikes[index],
                          onDelete: (bikeItemVal) {
                            BlocProvider.of(context).add(DeleteBikeItem(bikeItemVal));
                          },
                        ))),
          );
        } else {
          return Container(child: null);
        }
      },
    );
  }
}
