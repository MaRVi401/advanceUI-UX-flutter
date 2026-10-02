import 'package:flutter_test/flutter_test.dart';
import 'package:advance_uiux/main.dart';

void main() {
  testWidgets('PracticalApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PracticalApp());

    // Verify that the title exists.
    expect(find.text('Praktikum Advance UI/UX'), findsOneWidget);
  });
}