// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('profile screen shows its main sections', (
    WidgetTester tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(390, 844);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MyApp());

    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Tris Bơ'), findsOneWidget);
    expect(find.text('Skills & Expertise'), findsOneWidget);
    expect(find.text('Featured Projects'), findsOneWidget);
    expect(find.text('TP Hồ Chí Minh, Việt Nam'), findsOneWidget);
    expect(find.text('trandinhtri852@gmail.com'), findsOneWidget);
    expect(find.text('0886250112'), findsOneWidget);
    expect(
      tester.getSize(find.byKey(const ValueKey('profile-avatar'))),
      const Size(140, 140),
    );
    expect(
      tester.getSize(find.byKey(const ValueKey('project-E-Shop Flutter'))),
      const Size(165, 145),
    );
  });
}
