import 'package:equatable/equatable.dart';
import 'package:is_coding_task/model/bike_item.dart';

abstract class BikeShopState extends Equatable{

  const BikeShopState();

  @override
  List<Object> get props => [];

}

class BikeShopLoading extends BikeShopState{}


class BikeShopLoaded extends BikeShopState{
  final List<BikeItem> bikes;

  const BikeShopLoaded([this.bikes = const []]);

  @override
  List<Object> get props => [bikes];

  @override
  String toString() => "BikeShopLoaded{bikes: $bikes}";
}


class BikeShopNotLoaded extends BikeShopState{}