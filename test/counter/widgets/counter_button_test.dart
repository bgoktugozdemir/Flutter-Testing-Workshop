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
        await tester.pumpMaterialApp(widget);
        // TODO(23): Test it
        final finder = find.byWidget(widget);
        expect(finder, findsOneWidget);
      },
    );

    testWidgets(
      'renders widget with all parameters',
      (tester) async {
        final widget = renderCounterButton(backgroundColor: backgroundColor);
        await tester.pumpMaterialApp(widget);

        // TODO(24): Test it
        final finder = find.byWidget(widget);
        expect(finder, findsOneWidget);
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
        expect(didPressButton, isFalse);

        await tester.tap(button);

        expect(didPressButton, isTrue);
      },
    );

    testWidgets(
      'shows correct tooltip',
      (tester) async {
        final widget = renderCounterButton();
        await tester.pumpMaterialApp(widget);

        // TODO(27): find tooltip
        final tooltip = find.byTooltip(tooltipMessage);

        // TODO(28): Test it
        expect(tooltip, findsOneWidget);
      },
    );

    testWidgets(
      'shows correct backgroundColor',
      (tester) async {
        // TODO(29): renderCounterButton with backgroundColor
        final widget = renderCounterButton(backgroundColor: backgroundColor);
        await tester.pumpMaterialApp(widget);

        // TODO(30): find FloatingActionButton widget
        final button = tester
            .widget<FloatingActionButton>(find.byType(FloatingActionButton));

        // TODO(31): Test it
        expect(button.backgroundColor, backgroundColor);
      },
    );

    testWidgets(
      'shows correct icon',
      (tester) async {
        final widget = renderCounterButton();
        await tester.pumpMaterialApp(widget);

        // TODO(32): find icon
        final icon = find.widgetWithIcon(CounterButton, iconData);

        // TODO(33): Test it
        expect(icon, findsOneWidget);
      },
    );
  });
}
