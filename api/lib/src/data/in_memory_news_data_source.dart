import 'dart:math' as math;

import 'package:google_news_template_api/api.dart';
import 'package:google_news_template_api/src/data/models/models.dart';
import 'package:news_blocks/news_blocks.dart';

part 'static_news_data.dart';

/// {@template in_memory_news_data_source}
/// An implementation of [NewsDataSource] which
/// is powered by in-memory news content.
/// {@endtemplate}
class InMemoryNewsDataSource implements NewsDataSource {
  /// {@macro in_memory_news_data_store}
  const InMemoryNewsDataSource();

  @override
  Future<Article?> getArticle({
    required String id,
    int limit = 20,
    int offset = 0,
  }) async {
    final result = _newsItems.where((item) => item.post.id == id);
    if (result.isEmpty) return null;
    final article = result.first.content.toArticle();
    final totalBlocks = article.totalBlocks;
    final normalizedOffset = math.min(offset, totalBlocks);
    final blocks =
        article.blocks.sublist(normalizedOffset).take(limit).toList();
    return Article(blocks: blocks, totalBlocks: totalBlocks);
  }

  @override
  Future<Feed> getFeed({
    Category category = Category.top,
    int limit = 20,
    int offset = 0,
  }) async {
    final feed =
        _newsFeedData[category] ?? const Feed(blocks: [], totalBlocks: 0);
    final totalBlocks = feed.totalBlocks;
    final normalizedOffset = math.min(offset, totalBlocks);
    final blocks = feed.blocks.sublist(normalizedOffset).take(limit).toList();
    return Feed(blocks: blocks, totalBlocks: totalBlocks);
  }

  @override
  Future<List<Category>> getCategories() async => _newsFeedData.keys.toList();
}
