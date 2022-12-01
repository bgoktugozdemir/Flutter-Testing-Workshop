import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_workshop/counter/widgets/counter_button.dart';

import '../../pump.dart';

void main() {
  group('CounterButton', () {
    const iconData = Icons.abc;
    const tooltipMessage = 'abc';
    const backgroundColor = Colors.grey;

    bool didPressButton = false;

    Widget renderCounterButton({Color? backgroundColor}) => CounterButton(
          onPressed: () {
            didPressButton = true;
          },
          icon: iconData,
          tooltip: tooltipMessage,
          backgroundColor: backgroundColor,
        );

    testWidgets(
      'renders widget with only required parameters',
      (tester) async {
        final widget = renderCounterButton();
        // TODO(22): pumpMaterialApp

        // TODO(23): Test it
      },
    );

    testWidgets(
      'renders widget with all parameters',
      (tester) async {
        final widget = renderCounterButton(backgroundColor: backgroundColor);
        await tester.pumpMaterialApp(widget);

        // TODO(24): Test it
      },
    );

    testWidgets(
      'calls onPressed when tapping on the button',
      (tester) async {
        final widget = renderCounterButton();
        await tester.pumpMaterialApp(widget);

        // TODO(25): find CounterButton

        final button = find.byType(CounterButton);

        // TODO(26): Test it
      },
    );

    testWidgets(
      'shows correct tooltip',
      (tester) async {
        final widget = renderCounterButton();
        await tester.pumpMaterialApp(widget);

        // TODO(27): find tooltip

        // TODO(28): Test it
      },
    );

    testWidgets(
      'shows correct backgroundColor',
      (tester) async {
        // TODO(29): renderCounterButton with backgroundColor
        final widget = renderCounterButton();
        await tester.pumpMaterialApp(widget);

        // TODO(30): find FloatingActionButton widget

        // TODO(31): Test it
      },
    );

    testWidgets(
      'shows correct icon',
      (tester) async {
        final widget = renderCounterButton();
        await tester.pumpMaterialApp(widget);

        // TODO(32): find icon

        // TODO(33): Test it
      },
    );
  });
}
