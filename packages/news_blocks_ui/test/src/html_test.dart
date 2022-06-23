// ignore_for_file: prefer_const_constructors

import 'package:flutter_html/flutter_html.dart' as flutter_html;
import 'package:flutter_test/flutter_test.dart';
import 'package:news_blocks/news_blocks.dart';
import 'package:news_blocks_ui/news_blocks_ui.dart';

import '../helpers/helpers.dart';

void main() {
  group('Html', () {
    testWidgets('renders HTML text correctly', (tester) async {
      const block = HtmlBlock(content: '<p>Hello</p>');

      await tester.pumpApp(Html(block: block));

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is flutter_html.Html && widget.data == block.content,
        ),
        findsOneWidget,
      );
    });
  });
}
