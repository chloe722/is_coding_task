import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:is_coding_task/constants.dart';
import 'package:is_coding_task/model/bike_item.dart';
import 'package:is_coding_task/screens/edit_add_bike_screen.dart';
import 'package:is_coding_task/strings.dart';
import 'package:is_coding_task/widgets/rounded_button.dart';

void main() {


  group("editAdd bike test", () {

    var onSaveTapped = false;

    final screen = MaterialApp(
      home: Scaffold(
        body: EditAddScreen(
          isEditing: true,
          onSave: (_) {
            onSaveTapped = true;
          },
          bikeItem: BikeItem(
              id: "1",
              description: "This bike is great",
              location: "Berlin",
              photoUrl: kBikeTempImage,
              name: "Hero 25",
              priceRange: "Cheap",
              category: "Hybrid",
              frameSize: "L"),
        ),
      ),
    );

    testWidgets("should call onSvae when save button is tapped",
        (WidgetTester tester) async {

      await tester.pumpWidget(screen);
      await tester.tap(find.byType(RoundedButton));
      expect(onSaveTapped, true);
    });


    testWidgets("bike name formField value is empty test", (WidgetTester tester) async {

      Finder bikeNameFinder = find.byKey(Key("BikeNameFormField"));

      await tester.pumpWidget(screen);

      await tester.tap(bikeNameFinder);
      await tester.enterText(bikeNameFinder, "");
      await tester.tap(find.byKey(Key("SaveButton")));
      await tester.pump();
      expect(find.text(kBikeNameErrorLabel), findsOneWidget);

    });


    testWidgets("location formField value is empty  test", (WidgetTester tester) async {

      Finder locationFinder = find.byKey(Key("LocationFormField"));

      await tester.pumpWidget(screen);

      await tester.tap(locationFinder);
      await tester.enterText(locationFinder, "");
      await tester.tap(find.byKey(Key("SaveButton")));
      await tester.pump();
      expect(find.text(kLocationErrorLabel), findsOneWidget);

    });

    testWidgets("description formField value is empty test", (WidgetTester tester) async {


      Finder desFinder = find.byKey(Key("DesFormField"));
      Finder listViewFinder = find.byKey(Key("FormListView"));

      await tester.pumpWidget(screen);
      await tester.drag(listViewFinder, const Offset(0.0, -600));
      await tester.pump();
      await tester.tap(desFinder);
      await tester.enterText(desFinder, "");
      await tester.tap(find.byKey(Key("SaveButton")));
      await tester.pump();
      expect(find.text(kBikeDescriptionError), findsOneWidget);
    });


  });

}
