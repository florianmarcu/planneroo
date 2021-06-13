// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:planneroo/main.dart';
import 'package:planneroo/views/DayPage.dart';

void main() {
  testWidgets('Main Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    var day = find.widgetWithText(Text, '10');
    expect(day, findsOneWidget);
    await tester.tap(day);
    await tester.pump();

    var addBtn = find.byIcon(Icons.add);
    expect(addBtn, findsOneWidget);
    await tester.tap(addBtn);
    await tester.pump();
    //await tester.tap(find.by)
    //expect()
    //expect(find.text('Jan'), findsWidgets);

    // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Day test', (WidgetTester tester) async {
    await tester.pumpWidget(DayPage());
  });
}
