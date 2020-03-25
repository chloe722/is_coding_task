import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_coding_task/bloc/barrel.dart';
import 'package:is_coding_task/bloc_delegate.dart';
import 'package:is_coding_task/routes.dart';
import 'package:is_coding_task/screens/add_bike_screen.dart';
import 'package:is_coding_task/screens/detail_screen.dart';
import 'package:is_coding_task/screens/home_screen.dart';
import 'package:is_coding_task/repository.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(BlocProvider(
    create: (context) {
      return BikeShopBloc(
        repository: Repository(),
      )..add(LoadBikes());
    }, child: BikeShopApp()));
}

class BikeShopApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bike Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Routes.home: (context) {
          return HomeScreen();
        },
        Routes.addBikeItem: (context) {
          return AddBikeScreen();
        },
      },
    );
  }
}
