import 'package:equatable/equatable.dart';
import 'package:google_news_template_api/client.dart';

/// {@template news_failure}
/// Base failure class for the news repository failures.
/// {@endtemplate}
abstract class NewsFailure with EquatableMixin implements Exception {
  /// {@macro news_failure}
  const NewsFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object?> get props => [error];
}

/// {@template get_article_failure}
/// Thrown when fetching an article fails.
/// {@endtemplate}
class GetArticleFailure extends NewsFailure {
  /// {@macro get_article_failure}
  const GetArticleFailure(super.error);
}

/// {@template get_feed_failure}
/// Thrown when fetching feed fails.
/// {@endtemplate}
class GetFeedFailure extends NewsFailure {
  /// {@macro get_feed_failure}
  const GetFeedFailure(super.error);
}

/// {@template get_categories_failure}
/// Thrown when fetching categories fails.
/// {@endtemplate}
class GetCategoriesFailure extends NewsFailure {
  /// {@macro get_categories_failure}
  const GetCategoriesFailure(super.error);
}

/// {@template popular_search_failure}
/// Thrown when fetching popular searches fails.
/// {@endtemplate}
class PopularSearchFailure extends NewsFailure {
  /// {@macro popular_search_failure}
  const PopularSearchFailure(super.error);
}

/// {@template news_repository}
/// A repository that manages news data.
/// {@endtemplate}
class NewsRepository {
  /// {@macro news_repository}
  const NewsRepository({
    required GoogleNewsTemplateApiClient apiClient,
  }) : _apiClient = apiClient;

  final GoogleNewsTemplateApiClient _apiClient;

  /// Requests article content metadata.
  ///
  /// Supported parameters:
  /// * [id] - article id for which content is requested.
  /// * [limit] - The number of results to return.
  /// * [offset] - The (zero-based) offset of the first item
  /// in the collection to return.
  Future<ArticleResponse> getArticle({
    required String id,
    int? limit,
    int? offset,
  }) async {
    try {
      return await _apiClient.getArticle(
        id: id,
        limit: limit,
        offset: offset,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetArticleFailure(error), stackTrace);
    }
  }

  /// Requests news feed metadata.
  ///
  /// Supported parameters:
  /// * [category] - the desired news [Category].
  /// * [limit] - The number of results to return.
  /// * [offset] - The (zero-based) offset of the first item
  /// in the collection to return.
  Future<FeedResponse> getFeed({
    Category? category,
    int? limit,
    int? offset,
  }) async {
    try {
      return await _apiClient.getFeed(
        category: category,
        limit: limit,
        offset: offset,
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetFeedFailure(error), stackTrace);
    }
  }

  /// Requests the available news categories.
  Future<CategoriesResponse> getCategories() async {
    try {
      return await _apiClient.getCategories();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetCategoriesFailure(error), stackTrace);
    }
  }

  /// Subscribes the provided [email] to the newsletter.
  Future<void> subscribeToNewsletter({required String email}) async {
    try {
      await _apiClient.subscribeToNewsletter(email: email);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(GetFeedFailure(error), stackTrace);
    }
  }

  /// Requests the popular searches.
  Future<PopularSearchResponse> popularSearch() async {
    try {
      return await _apiClient.popularSearch();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(PopularSearchFailure(error), stackTrace);
    }
  }
}
