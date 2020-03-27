import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:is_coding_task/bloc/barrel.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/screens/detail_screen.dart';
import 'package:mockito/mockito.dart';

class MockBikeShopBloc extends MockBloc<BikeShopEvent, BikeShopState> implements BikeShopBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MockBikeShopBloc bikeShopBloc;

  setUp(() {
    bikeShopBloc = MockBikeShopBloc();
  });

  tearDown(() {
    bikeShopBloc.close();
  });

  final detailScreen = BlocProvider<BikeShopBloc>(
    create: (context) {
      return bikeShopBloc;
    },
    child: MaterialApp(
      home: BlocBuilder<BikeShopBloc, BikeShopState>(
          builder: (context, state) => DetailScreen("1")),
    ),
  );

  testWidgets("test detail screen UI", (WidgetTester tester) async {
    when(bikeShopBloc.state)
        .thenReturn(BikeShopLoaded([BikeItem(id: "1", name: "Hero 24")]));

    await tester.pumpWidget(detailScreen);
    expect(find.text("Hero 24"), findsOneWidget);
  });
}
