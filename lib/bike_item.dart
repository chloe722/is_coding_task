import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class BikeItem extends Equatable {
  final String id;
  final String frameSize;
  final String category;
  final String location;
  final String name;
  final String photoUrl;
  final String priceRange;
  final String description;

  BikeItem(
      {String id,
      this.frameSize = "",
      this.category = "",
      this.location = "",
      this.name = "",
      this.photoUrl = "",
      this.priceRange = "",
      this.description = ""})
      : this.id = id ?? Uuid().v1();

  BikeItem copyWith(
      {String id,
      String frameSize,
      String category,
      String location,
      String name,
      String photoUrl,
      String priceRange,
      String description}) {
    return BikeItem(
        id: id ?? this.id,
        frameSize: frameSize ?? this.frameSize,
        category: category ?? this.category,
        location: name ?? this.name,
        photoUrl: photoUrl ?? this.photoUrl,
        priceRange: priceRange ?? this.priceRange,
        description: description ?? this.description);
  }

  @override
  List<Object> get props => [
        id,
        frameSize,
        category,
        location,
        name,
        photoUrl,
        priceRange,
        description
      ];

  @override
  String toString() {
    return 'BikeItem{id: $id,'
        ' frameSize: $frameSize,'
        ' category: $category,'
        ' location: $location,'
        ' name: $name,'
        ' photoUrl: $photoUrl,'
        ' priceRange: $priceRange,'
        ' description: $description}';
  }
}
