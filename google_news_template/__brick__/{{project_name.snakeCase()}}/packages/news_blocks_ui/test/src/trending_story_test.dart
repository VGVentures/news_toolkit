// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_blocks/news_blocks.dart';
import 'package:news_blocks_ui/news_blocks_ui.dart';

import '../helpers/helpers.dart';

void main() {
  group('TrendingStory', () {
    setUpAll(setUpTolerantComparator);

    testWidgets('renders correctly', (tester) async {
      final widget = Center(
        child: TrendingStory(
          title: 'TRENDING',
          block: TrendingStoryBlock(
            content: PostSmallBlock(
              id: 'id',
              category: PostCategory.technology,
              author: 'author',
              publishedAt: DateTime(2022, 3, 11),
              imageUrl: 'imageUrl',
              title: 'title',
            ),
          ),
        ),
      );

      await tester.pumpApp(widget);

      await expectLater(
        find.byType(TrendingStory),
        matchesGoldenFile('trending_story.png'),
      );
    });
  });
}
