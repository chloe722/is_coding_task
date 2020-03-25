import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/bloc/bike_shop_event.dart';
import 'package:is_coding_task/bloc/bike_shop_state.dart';
import 'package:is_coding_task/repository.dart';

class BikeShopBloc extends Bloc<BikeShopEvent, BikeShopState> {
  final Repository repository;

  BikeShopBloc({@required this.repository});

  @override
  BikeShopState get initialState => BikeShopLoading();

  @override
  Stream<BikeShopState> mapEventToState(BikeShopEvent event) async* {

    if (event is BikeShopLoaded) {
      yield* _mapLoadBikeShopToState();

    } else if (event is AddBikeItem) {
      yield* _mapAddBikeItemToState(event);

    } else if (event is UpdateBikeItem) {
      yield* _mapUpdateBikeItemToState(event);

    } else if (event is DeleteBikeItem) {
      yield* _mapDeleteBikeItemToState(event);
    }

  }

  Stream<BikeShopState> _mapLoadBikeShopToState() async* {
    final List<BikeItem> bikes = await repository.loadBikes();

    yield BikeShopLoaded(bikes);
  }

  Stream<BikeShopState> _mapAddBikeItemToState(AddBikeItem event) async* {
    if (state is BikeShopLoaded) {
      final List<BikeItem> updatedBikes =
          List.from((state as BikeShopLoaded).bikes)..add(event.bikeItem);
      yield BikeShopLoaded(updatedBikes);
      _saveBikes(updatedBikes);
    }
  }

  Stream<BikeShopState> _mapUpdateBikeItemToState(UpdateBikeItem event) async* {
    if (event is BikeShopLoaded) {
      final List<BikeItem> updatedBikes =
          (state as BikeShopLoaded).bikes.map((bike) {
        return bike.id == event.updatedBikeItem.id
            ? event.updatedBikeItem
            : bike;
      }).toList();
      yield BikeShopLoaded(updatedBikes);
      _saveBikes(updatedBikes);

    }
  }

  Stream<BikeShopState> _mapDeleteBikeItemToState(DeleteBikeItem event) async* {
    if (event is BikeShopLoaded) {
      final updatedBikes = (state as BikeShopLoaded)
          .bikes
          .where((bike) => bike.id != event.bikeItem.id)
          .toList();
      yield BikeShopLoaded(updatedBikes);
            _saveBikes(updatedBikes);
    }
  }


  //TODO: implement save
  void _saveBikes(List<BikeItem> bikes) {
  }
}

