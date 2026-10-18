import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:login_ui/main.dart';

void main() {
  testWidgets('renders login form and validates empty input',
      (WidgetTester tester) async {
    await tester.pumpWidget(const LoginApp());

    // Core elements are present.
    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.widgetWithText(FilledButton, 'Sign in'), findsOneWidget);

    // Submitting an empty form shows validation errors.
    await tester.tap(find.widgetWithText(FilledButton, 'Sign in'));
    await tester.pump();
    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
  });

  testWidgets('password visibility toggle reveals obscured input',
      (WidgetTester tester) async {
    await tester.pumpWidget(const LoginApp());

    // Password starts obscured; suffix icon shows the "show" action.
    expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);

    await tester.tap(find.byIcon(Icons.visibility_outlined));
    await tester.pump();

    expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);
  });
}
