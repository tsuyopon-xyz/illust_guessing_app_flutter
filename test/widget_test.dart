import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:illust_guessing_app/main.dart';

void main() {
  testWidgets('Test', (WidgetTester tester) async {
    await tester.pumpWidget(const GHFlutterApp());

    expect(find.text('GHFlutter'), findsOneWidget);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
