import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension Pump on WidgetTester {
  // TODO(0): Understand the code
  Future<void> pumpMaterialApp(Widget widget) async {
    return pumpWidget(
      MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: widget,
      ),
    );
  }
}
