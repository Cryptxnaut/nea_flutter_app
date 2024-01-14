import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nea_flutter_app/main.dart';

void main() {
  testWidgets('Test JoystickExampleApp', (WidgetTester tester) async {
    // Build JoystickExampleApp and trigger a frame.
    await tester.pumpWidget(const JoystickExampleApp());

    // Verify that the title appears on the screen.
    expect(find.text('Joystick Example'), findsOneWidget);

    // Your additional test logic can go here.
    // For example, you can interact with widgets, simulate user actions, and make assertions.

    // Example: Tap the ElevatedButton and trigger a frame.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Example: Verify that a widget with specific text appears after the button is tapped.
    expect(find.text('Joystick'), findsOneWidget);
  });
}
