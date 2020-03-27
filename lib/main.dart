import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_coding_task/bloc/barrel.dart';
import 'package:is_coding_task/bloc_delegate.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/repository.dart';
import 'package:is_coding_task/routes.dart';
import 'package:is_coding_task/screens/edit_add_bike_screen.dart';
import 'package:is_coding_task/screens/home_screen.dart';
import 'package:is_coding_task/size_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(BlocProvider(
      create: (context) {
        return BikeShopBloc(
          repository: Repository(),
        )..add(LoadBikes());
      },
      child: BikeShopApp()));
}

class BikeShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bike Shop',
      theme: ThemeData(
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: kDarkGreen),
        appBarTheme: AppBarTheme(
            elevation: 0.0,
            color: Colors.white,
            iconTheme: IconThemeData(color: kDarkGreen)),
      ),
      routes: {
        Routes.home: (context) {
          return HomeScreen();
        },
        Routes.addBikeItem: (context) {
          return EditAddScreen(
            isEditing: false,
            onSave: (bikeItemVal) {
              BlocProvider.of<BikeShopBloc>(context)
                  .add(AddBikeItem(bikeItemVal));
            },
          );
        },
      },
    );
  }
}
