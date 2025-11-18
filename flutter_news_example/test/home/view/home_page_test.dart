// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_news_example/feed/feed.dart';
import 'package:flutter_news_example/home/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_repository/news_repository.dart';

import '../../helpers/helpers.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  initMockHydratedStorage();

  late NewsRepository newsRepository;

  setUp(() {
    newsRepository = MockNewsRepository();
    final healthCategory = Category(id: 'health', name: 'Health');

    when(
      newsRepository.getCategories,
    ).thenAnswer((_) async => CategoriesResponse(categories: [healthCategory]));
    when(
      () => newsRepository.getFeed(
        categoryId: any(named: 'categoryId'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    ).thenAnswer((_) async => FeedResponse(feed: [], totalCount: 0));
  });

  test('has a page', () {
    expect(HomePage.page(), isA<MaterialPage<void>>());
  });

  testWidgets('renders a HomeView', (tester) async {
    await tester.pumpApp(const HomePage(), newsRepository: newsRepository);

    expect(find.byType(HomeView), findsOneWidget);
  });

  testWidgets('renders FeedView', (tester) async {
    await tester.pumpApp(const HomePage(), newsRepository: newsRepository);

    expect(find.byType(FeedView), findsOneWidget);
  });
}
