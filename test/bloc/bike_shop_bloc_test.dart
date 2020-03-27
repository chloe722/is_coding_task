import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:is_coding_task/bloc/barrel.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/repository.dart';
import 'package:mockito/mockito.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  group("BikeShopBloc", () {
    Repository repository;
    BikeShopBloc bikeShopBloc;

    setUp(() {
      repository = MockRepository();
      bikeShopBloc = BikeShopBloc(repository: repository);
    });

    test("throw AssertionError if Repository is null", () {
      expect(
        () => BikeShopBloc(repository: null),
        throwsA(isAssertionError),
      );
    });

    group("BikesRequest", () {
      final bikes = [
        BikeItem(
            id: "1",
            name: "Fast Bike",
            priceRange: "Expensive",
            frameSize: "L"),
        BikeItem(
            id: "2", name: "Hero 24", priceRange: "Normal", frameSize: "M"),
      ];

      blocTest(
        "emit [BikeShopLoaded] when BikesRequest is added and getBikes succeeds",
        build: () async {
          when(repository.loadBikes()).thenAnswer((_) => Future.value(bikes));
          return bikeShopBloc;
        },
        act: (bloc) => bloc.add(LoadBikes()),
        expect: [
          BikeShopLoaded(bikes),
        ],
      );
    });
  });
}
