// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  group('AppButton', () {
    testWidgets('renders button', (tester) async {
      final buttonText = Text('buttonText');
      await tester.pumpApp(
        Column(
          children: [
            AppButton.black(
              child: buttonText,
            ),
            AppButton.smallOutlineTransparent(
              child: buttonText,
            ),
            AppButton.redWine(
              child: buttonText,
            ),
            AppButton.blueDress(
              child: buttonText,
            ),
          ],
        ),
      );
      expect(find.byType(AppButton), findsNWidgets(4));
      expect(find.text('buttonText'), findsNWidgets(4));
    });

    testWidgets(
        'renders black button '
        'when `AppButton.black()` called', (tester) async {
      final buttonText = Text('buttonText');

      await tester.pumpApp(
        AppButton.black(
          child: buttonText,
          onPressed: () {},
        ),
      );

      final finder = find.byType(ElevatedButton);
      final widget = tester.widget(finder) as ElevatedButton;

      expect(
        widget.style?.backgroundColor?.resolve({}),
        AppColors.black,
      );
      expect(
        widget.style?.textStyle?.resolve({}),
        AppTextStyle.button,
      );
    });

    testWidgets(
        'renders blueDress button '
        'when `AppButton.blueDress()` called', (tester) async {
      final buttonText = Text('buttonText');

      await tester.pumpApp(
        AppButton.blueDress(
          child: buttonText,
          onPressed: () {},
        ),
      );

      final finder = find.byType(ElevatedButton);
      final widget = tester.widget(finder) as ElevatedButton;

      expect(
        widget.style?.backgroundColor?.resolve({}),
        AppColors.blueDress,
      );
      expect(
        widget.style?.textStyle?.resolve({}),
        AppTextStyle.button,
      );
    });

    testWidgets(
        'renders crystalBlue button '
        'when `AppButton.crystalBlue()` called', (tester) async {
      final buttonText = Text('buttonText');

      await tester.pumpApp(
        AppButton.crystalBlue(
          child: buttonText,
          onPressed: () {},
        ),
      );

      final finder = find.byType(ElevatedButton);
      final widget = tester.widget(finder) as ElevatedButton;

      expect(
        widget.style?.backgroundColor?.resolve({}),
        AppColors.crystalBlue,
      );
      expect(
        widget.style?.textStyle?.resolve({}),
        AppTextStyle.button,
      );
    });

    testWidgets(
        'renders redWine button '
        'when `AppButton.redWine()` called', (tester) async {
      final buttonText = Text('buttonText');

      await tester.pumpApp(
        AppButton.redWine(
          child: buttonText,
          onPressed: () {},
        ),
      );

      final finder = find.byType(ElevatedButton);
      final widget = tester.widget(finder) as ElevatedButton;

      expect(
        widget.style?.backgroundColor?.resolve({}),
        AppColors.redWine,
      );
      expect(
        widget.style?.textStyle?.resolve({}),
        AppTextStyle.button,
      );
    });

    testWidgets(
        'renders darkAqua button '
        'when `AppButton.darkAqua()` called', (tester) async {
      final buttonText = Text('buttonText');

      await tester.pumpApp(
        AppButton.darkAqua(
          child: buttonText,
          onPressed: () {},
        ),
      );

      final finder = find.byType(ElevatedButton);
      final widget = tester.widget(finder) as ElevatedButton;

      expect(
        widget.style?.backgroundColor?.resolve({}),
        AppColors.darkAqua,
      );
      expect(
        widget.style?.textStyle?.resolve({}),
        AppTextStyle.button,
      );
    });
    testWidgets(
        'renders outlinedTransparent button '
        'when `AppButton.outlinedTransparent()` called', (tester) async {
      final buttonText = Text('buttonText');

      await tester.pumpApp(
        AppButton.outlinedTransparent(
          child: buttonText,
          onPressed: () {},
        ),
      );

      final finder = find.byType(ElevatedButton);
      final widget = tester.widget(finder) as ElevatedButton;

      expect(
        widget.style?.backgroundColor?.resolve({}),
        AppColors.transparent,
      );
      expect(
        widget.style?.textStyle?.resolve({}),
        AppTextStyle.button,
      );
    });

    testWidgets(
        'renders outlinedWhite button '
        'when `AppButton.outlinedWhite()` called', (tester) async {
      final buttonText = Text('buttonText');

      await tester.pumpApp(
        AppButton.outlinedWhite(
          child: buttonText,
          onPressed: () {},
        ),
      );

      final finder = find.byType(ElevatedButton);
      final widget = tester.widget(finder) as ElevatedButton;

      expect(
        widget.style?.backgroundColor?.resolve({}),
        AppColors.white,
      );
      expect(
        widget.style?.textStyle?.resolve({}),
        AppTextStyle.button,
      );
    });

    testWidgets(
        'renders smallRedWine button '
        'when `AppButton.smallRedWine()` called', (tester) async {
      final buttonText = Text('buttonText');

      await tester.pumpApp(
        AppButton.smallRedWine(
          child: buttonText,
          onPressed: () {},
        ),
      );

      final finder = find.byType(ElevatedButton);
      final widget = tester.widget(finder) as ElevatedButton;

      expect(
        widget.style?.backgroundColor?.resolve({}),
        AppColors.redWine,
      );
      expect(
        widget.style?.textStyle?.resolve({}),
        AppTextStyle.smallButton,
      );
    });

    testWidgets(
        'renders smallTransparent button '
        'when `AppButton.smallTransparent()` called', (tester) async {
      final buttonText = Text('buttonText');

      await tester.pumpApp(
        AppButton.smallTransparent(
          child: buttonText,
          onPressed: () {},
        ),
      );

      final finder = find.byType(ElevatedButton);
      final widget = tester.widget(finder) as ElevatedButton;

      expect(
        widget.style?.backgroundColor?.resolve({}),
        AppColors.transparent,
      );
      expect(
        widget.style?.textStyle?.resolve({}),
        AppTextStyle.smallButton,
      );
    });

    testWidgets(
        'renders smallOutlineTransparent button '
        'when `AppButton.smallOutlineTransparent()` called', (tester) async {
      final buttonText = Text('buttonText');

      await tester.pumpApp(
        AppButton.smallOutlineTransparent(
          child: buttonText,
          onPressed: () {},
        ),
      );

      final finder = find.byType(ElevatedButton);
      final widget = tester.widget(finder) as ElevatedButton;

      expect(
        widget.style?.backgroundColor?.resolve({}),
        AppColors.transparent,
      );
      expect(
        widget.style?.textStyle?.resolve({}),
        AppTextStyle.smallButton,
      );
    });

    testWidgets(
        'changes background color to AppColors.black.withOpacity(.12)  '
        'when `onPressed` is null', (tester) async {
      final buttonText = Text('buttonText');

      await tester.pumpApp(
        AppButton.smallOutlineTransparent(
          child: buttonText,
        ),
      );

      final finder = find.byType(ElevatedButton);
      final widget = tester.widget(finder) as ElevatedButton;

      expect(
        widget.style?.backgroundColor?.resolve({}),
        AppColors.black.withOpacity(.12),
      );
    });
  });
}
