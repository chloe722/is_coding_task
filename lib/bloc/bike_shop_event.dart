import 'package:equatable/equatable.dart';
import 'package:is_coding_task/model/bike_item.dart';

abstract class BikeShopEvent extends Equatable {

  const BikeShopEvent();

  @override
  List<Object> get props => [];
}

class LoadBikes extends BikeShopEvent{}

class AddBikeItem extends BikeShopEvent{
  final BikeItem bikeItem;

  const AddBikeItem(this.bikeItem);

  @override
  List<Object> get props => [bikeItem];

  @override
  String toString() => "AddBikeItem{bikeItem: $bikeItem}";

}

class UpdateBikeItem extends BikeShopEvent{
  final BikeItem updatedBikeItem;

  const UpdateBikeItem(this.updatedBikeItem);

  @override
  List<Object> get props => [updatedBikeItem];

  @override
  String toString() => "UpdateBikeItem{updatedBikeItem: $updatedBikeItem}";

}

class DeleteBikeItem extends BikeShopEvent {
  final BikeItem bikeItem;

  const DeleteBikeItem(this.bikeItem);

  @override
  List<Object> get props => [bikeItem];

  @override
  String toString() => "DeleteBikeItem{bikeItem: $bikeItem}";

}


