import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:is_coding_task/bloc/barrel.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/screens/home_screen.dart';
import 'package:is_coding_task/widgets/bike_item_card.dart';
import 'package:is_coding_task/widgets/center_indicator.dart';
import 'package:mockito/mockito.dart';

class MockBikeShopBloc extends MockBloc<BikeShopBloc, BikeShopState>
    implements BikeShopBloc {}

void main() {
  MockBikeShopBloc bikeShopBloc;

  setUp(() {
    bikeShopBloc = MockBikeShopBloc();
  });

  tearDown(() {
    bikeShopBloc?.close();
  });

  final homeScreen = BlocProvider<BikeShopBloc>(
      create: (context) {
        return bikeShopBloc;
      },
      child: MaterialApp(home: HomeScreen()));

  group("home screen test", () {

    testWidgets("home while loading", (WidgetTester tester) async {
      when(bikeShopBloc.state).thenReturn(BikeShopLoading());
      await tester.pumpWidget(homeScreen);
      expect(find.byType(CenterIndicator), findsOneWidget);

    });

    testWidgets("bikes loaded",
            (WidgetTester tester) async {
          when(bikeShopBloc.state)
              .thenReturn(BikeShopLoaded([BikeItem(id: "1", name: "Hero 24")]));
          await tester.pumpWidget(homeScreen);
          expect(find.byType(ListView), findsWidgets);
          expect(find.byType(BikeItemCard), findsWidgets);
          expect(find.byIcon(Icons.add), findsOneWidget);
          expect(find.byType(Scaffold), findsOneWidget);
          expect(find.byType(FloatingActionButton), findsOneWidget);
        });

  });

}
