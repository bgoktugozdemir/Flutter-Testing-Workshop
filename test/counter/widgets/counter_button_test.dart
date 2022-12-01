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
        await tester.pumpMaterialApp(widget);

        final counterButtonFinder = find.byWidget(widget);
        expect(counterButtonFinder, findsOneWidget);
      },
    );

    testWidgets(
      'renders widget with all parameters',
      (tester) async {
        final widget = renderCounterButton(backgroundColor: backgroundColor);
        await tester.pumpMaterialApp(widget);

        final counterButtonFinder = find.byWidget(widget);
        expect(counterButtonFinder, findsOneWidget);
      },
    );

    testWidgets(
      'calls onPressed when tapping on the button',
      (tester) async {
        final button = find.byType(CounterButton);
        final widget = renderCounterButton();
        await tester.pumpMaterialApp(widget);

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

        final tooltip = find.byTooltip(tooltipMessage);
        expect(tooltip, findsOneWidget);
      },
    );

    testWidgets(
      'shows correct backgroundColor',
      (tester) async {
        final widget = renderCounterButton(backgroundColor: backgroundColor);
        await tester.pumpMaterialApp(widget);

        final button = tester
            .widget<FloatingActionButton>(find.byType(FloatingActionButton));
        expect(button.backgroundColor, equals(backgroundColor));
      },
    );

    testWidgets(
      'shows correct icon',
      (tester) async {
        final icon = find.byIcon(iconData);
        final widget = renderCounterButton();
        await tester.pumpMaterialApp(widget);

        expect(icon, findsOneWidget);
      },
    );
  });
}
