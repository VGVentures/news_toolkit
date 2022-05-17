// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:news_blocks_ui/news_blocks_ui.dart';

import '../../helpers/helpers.dart';

void main() {
  group('PostContentCategory', () {
    testWidgets('renders category name in uppercase', (tester) async {
      final testPostContentCategory = PostContentCategory(
        categoryName: 'Test',
        premiumText: 'Premium',
        isContentOverlaid: false,
        isPremium: false,
        isSubscriberExclusive: false,
      );

      await tester.pumpContentThemedApp(testPostContentCategory);

      expect(
        find.text(testPostContentCategory.categoryName.toUpperCase()),
        findsOneWidget,
      );
    });
  });
}
