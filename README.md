# Google News Template

[![google_news_template][build_status_badge]][workflow_link]
![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

## Getting Started 🚀

This project contains the following flavors:

- development
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# development
$ flutter run --flavor development --target lib/main/main_development.dart
# production
$ flutter run --flavor production --target lib/main/main_production.dart

```

_\*Google News Template works on iOS, Android._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use the internal script `tool/coverage.sh`. Make sure to install [lcov](https://github.com/linux-test-project/lcov) before.

```sh
# Generate coverage report for the app
$ ./tool/coverage.sh

# Generate coverage report for the package
$ ./tool/coverage.sh packages/app_config_repository
```

---

## Generating assets 🖼️

We're using [flutter_gen](https://pub.dev/packages/flutter_gen) to generate statically safe descriptions of image and font assets.

You need to install the `flutter_gen` tool via brew or pub, by following the [installation instruction](https://pub.dev/packages/flutter_gen/install). The configuration of the tool is stored in `pubspec.yaml`.

After that you can easily recreate the assets descriptions by calling:

```bash
$> fluttergen
```

Then to reference the asset you can call:

```dart
Assets.images.unicornVgvBlack.image(height: 120),
```

If you're adding new assets to ui library, make sure to run `fluttergen` inside the package directory as well.

## Working with Translations 🌐

This project relies on [flutter_localizations](https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html) and follows the [official internationalization guide for Flutter](https://flutter.dev/docs/development/accessibility-and-localization/internationalization).

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:google_news_template/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
    <array>
        <string>en</string>
        <string>es</string>
    </array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

## Theme and Brand Updates

This template comes with already configured light and dark Theme for the app. To know more about Theme visit [Flutter theme guide](https://docs.flutter.dev/cookbook/design/themes).

```dart

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: const AppTheme().themeData,
      darkTheme: const AppDarkTheme().themeData,
      ...
    );
  }
}
```

Configuration of `colors`, `spacing`, `typography`, and globally used widgets can be found in the `lib/packages/app_ui` package within this project and can be maintained globally for the whole application.

Inside the `lib/packages/app_ui` project, the `gallery` folder contains example usage of the `colors`, `spacing`, and `typography`. It is a runnable project that allows you to browse how changes will impact styling of your widgets.

To access the global Theme, use the `BuildContext` tree to read correct styling values.

```dart
Widget build(BuildContext context) {
  return Text(
      context.l10n.loginModalTitle,
      style: Theme.of(context).textTheme.headline3,
  );
}
```

## Google News Template API

This package uses `google_news_template_api` that was created for the purpose of this template application. To get more information on how to use and customize the API see the [API README.md file](https://github.com/VGVentures/google_news_template/tree/main/api)

## News Data Source 📰

The `google_news_template_api` package defines an interface for a [`NewsDataSource`](https://github.com/VGVentures/google_news_template/blob/main/api/lib/src/data/news_data_source.dart):

```dart
/// {@template news_data_source}
/// An interface for a news content data source.
/// {@endtemplate}
abstract class NewsDataSource {
  /// {@macro news_data_source}
  const NewsDataSource();

  /// Returns a news [Article] for the provided article [id].
  ///
  /// In addition, the contents can be paginated by supplying
  /// [limit] and [offset].
  ///
  /// * [limit] - The number of content blocks to return.
  /// * [offset] - The (zero-based) offset of the first item
  /// in the collection to return.
  Future<Article?> getArticle({
    required String id,
    int limit = 20,
    int offset = 0,
  });

  /// Returns a list of current popular topics.
  Future<List<String>> getPopularTopics();

  /// Returns a list of current relevant topics
  /// based on the provided [term].
  Future<List<String>> getRelevantTopics({required String term});

  /// Returns a list of current popular article blocks.
  Future<List<NewsBlock>> getPopularArticles();

  /// Returns a list of relevant article blocks
  /// based on the provided [term].
  Future<List<NewsBlock>> getRelevantArticles({required String term});

  /// Returns [RelatedArticles] for the provided article [id].
  ///
  /// In addition, the contents can be paginated by supplying
  /// [limit] and [offset].
  ///
  /// * [limit] - The number of content blocks to return.
  /// * [offset] - The (zero-based) offset of the first item
  /// in the collection to return.
  Future<RelatedArticles> getRelatedArticles({
    required String id,
    int limit = 20,
    int offset = 0,
  });

  /// Returns a news [Feed] for the provided [category].
  /// By default [Category.top] is used.
  ///
  /// In addition, the feed can be paginated by supplying
  /// [limit] and [offset].
  ///
  /// * [limit] - The number of results to return.
  /// * [offset] - The (zero-based) offset of the first item
  /// in the collection to return.
  Future<Feed> getFeed({
    Category category = Category.top,
    int limit = 20,
    int offset = 0,
  });

  /// Returns a list of all available news categories.
  Future<List<Category>> getCategories();
}
```

An in-memory, mock implementation of the `NewsDataSource`, called [`InMemoryNewsDataSource`](https://github.com/VGVentures/google_news_template/blob/main/api/lib/src/data/in_memory_news_data_source.dart) is used to return static news content.

### Adding a Custom News Data Source ✨

To integrate with a custom news data source, define a class that implements the `NewsDataSource` interface:

```dart
class CustomNewsDataSource implements NewsDataSource {...}
```

Then in `api/bin/server.dart` inject the `CustomNewsDataSource`:

```dart
final handler = const Pipeline()
    // Inject a custom `NewsDataSource`.
    .inject<NewsDataSource>(const CustomNewsDataSource())
    .addMiddleware(logRequests())
    .addHandler(controller.handler);
```

## Authentication

Currently, this project supports multiple ways of authentication such as `email`, `google`, `apple`, `twitter` and `facebook` login.

The current implementation of the login functionality can be found in [FirebaseAuthenticationClient](https://github.com/VGVentures/google_news_template/blob/e25b4905604f29f6a2b165b7381e696f4ebc22ee/packages/authentication_client/firebase_authentication_client/lib/src/firebase_authentication_client.dart#L20) inside the `packages/authentication_client` package.

The package depends on the third-party packages that expose authentication methods such as:

- `firebase_auth`
- `flutter_facebook_auth`
- `google_sign_in`
- `sign_in_with_apple`
- `twitter_login`

The usage guide for each of these packages can be found on [pub.dev](https://pub.dev/).

## Newsletter

The current [implementation](https://github.com/VGVentures/google_news_template/blob/main/api/lib/src/api/v1/newsletter/create_subscription/create_subscription.dart) of newsletter email subscription will always return true and the response is handled in the app as a success state. Be aware that the current implementation of this feature does not store the subscriber state for a user.

```dart
/// Mixin on [Controller] which adds support for subscribing to a newsletter.
mixin CreateSubscriptionMixin on Controller {
  /// Subscribe to receive a newsletter.
  Future<Response> createSubscription(Request request) async {
    return JsonResponse.created();
  }
}
```

To fully leverage the newsletter subscription feature please add your API handling logic or an already existing email service, such as [mailchimp.](https://mailchimp.com/)

## Subscriptions and purchases

This project supports in-app purchasing for Flutter using the [in_app_purchase](https://pub.dev/packages/in_app_purchase) package. For the purpose of this template application, a mocked version of the`in_app_purchase` package was created called [purchase_client](https://github.com/VGVentures/google_news_template/tree/main/packages/purchase_client).

The [PurchaseClient class](https://github.com/VGVentures/google_news_template/blob/3f8d5cfd1106d3936b5d7582a82ca143c53d2535/packages/purchase_client/lib/src/purchase_client.dart#L36) implements `InAppPurchase` from the [in_app_purchase](https://pub.dev/packages/in_app_purchase) package and utilizes the same mechanism to expose the `purchaseStream`.

```
  @override
  Stream<List<PurchaseDetails>> get purchaseStream => _purchaseStream.stream;
```

Mocked products are being exposed in the [products.dart](https://github.com/VGVentures/google_news_template/blob/main/packages/purchase_client/lib/src/products.dart) file.

### in_app_purchase usage

To use the [in_app_purchase](https://pub.dev/packages/in_app_purchase) package, substitute `PurchaseClient` usage in [main_development.dart](https://github.com/VGVentures/google_news_template/blob/3f8d5cfd1106d3936b5d7582a82ca143c53d2535/lib/main/main_development.dart#L80) and [main_production.dart](https://github.com/VGVentures/google_news_template/blob/3f8d5cfd1106d3936b5d7582a82ca143c53d2535/lib/main/main_production.dart#L80) with the [in_app_purchase](https://pub.dev/packages/in_app_purchase) package implementation.

Than follow the [Getting started](https://pub.dev/packages/in_app_purchase#getting-started) paragraph in the [in_app_purchase](https://pub.dev/packages/in_app_purchase) package.

## Ads

This project uses [Google Mobile Ads Flutter plugin](https://pub.dev/packages/google_mobile_ads), which enables publishers to monetize this Flutter app using the Google Mobile Ads SDK. It utilizes the [Google Mobile Ads Flutter plugin](https://pub.dev/packages/google_mobile_ads) to achieve 4 different kinds of Ads: [InterstitialAd](https://github.com/VGVentures/google_news_template/blob/e25b4905604f29f6a2b165b7381e696f4ebc22ee/lib/ads/widgets/interstitial_ad.dart#L28), [RewardedAd](https://github.com/VGVentures/google_news_template/blob/e25b4905604f29f6a2b165b7381e696f4ebc22ee/lib/ads/widgets/rewarded_ad.dart#L28), [BannerAd](https://github.com/VGVentures/google_news_template/blob/e25b4905604f29f6a2b165b7381e696f4ebc22ee/packages/news_blocks_ui/lib/src/widgets/banner_ad_content.dart#L46) and [StickyAd](https://github.com/VGVentures/google_news_template/blob/e25b4905604f29f6a2b165b7381e696f4ebc22ee/lib/ads/widgets/sticky_ad.dart#L10).

To get more information about AdMob Ad types and usage visit [Google AdMob quick-start page](https://developers.google.com/admob/flutter/quick-start).

### Mediation and Open Bidding

To use mediation in your mobile app, follow the links below to prepare your Google AdMob network and your mobile app.

- [Overview of Mediation](https://admanager.google.com/home/resources/feature-brief-app-mediation/)
- [How-to Guide](https://support.google.com/admanager/answer/7387351?hl=en&ref_topic=6373639)

To use Open Bidding in your mobile app, follow the links below.

- [Developer Documentation](https://developers.google.com/admob/flutter/mediation/get-started)
- [Overview of Open-Bidding](https://admanager.google.com/home/resources/feature-brief-open-bidding/)
- [How-to Guide](https://support.google.com/admanager/answer/7128657?hl=en&ref_topic=7512060)

## Push Notifications 📢

This template comes with [Firebase Cloud Messaging][firebase_cloud_messaging_link] pre-configured.

Out of the box, the application subscribes to supported topics corresponding to supported news categories such as `health`, `science`, `sports`, etc.

### Triggering a Notification 📬

A notification can be triggered via the [Firebase Cloud Messaging REST API][firebase_cloud_messaging_rest_api_link].

All you need is an access token which can be generated via the [Google OAuth 2.0 Playground][google_oauth2_playground_link].

Select the `https://www.googleapis.com/auth/firebase.messaging` scope under Firebase Cloud Messaging API v1 and click "Authorize APIs".

Then, sign in with the Google Account that has access to the respective Firebase project and click "Exchange authorization code for tokens".

Now you can send a message to a topic by using the following cURL:

```
curl -X POST -H "Authorization: Bearer <ACCESS_TOKEN>" -H "Content-Type: application/json" -d '{
  "message": {
    "topic" : "<TOPIC-NAME>",
    "notification": {
      "body": "This is a Firebase Cloud Messaging Topic Test Message!",
      "title": "Test Notification"
    }
  }
}' https://fcm.googleapis.com/v1/projects/<PROJECT-ID>/messages:send HTTP/1.1
```

**❗️ Important**

> Replace `<ACCESS_TOKEN>` with the access token generated from the Google OAuth 2.0 Playground, `<TOPIC-NAME>` with the desired topic name, and `<PROJECT-ID>` with the corresponding Firebase project ID.

**💡 Note**

> Ensure you are running the application on a physical device in order to receive FCM messages.

[build_status_badge]: https://github.com/VGVentures/google_news_template/actions/workflows/main.yaml/badge.svg
[coverage_badge]: coverage_badge.svg
[firebase_cloud_messaging_link]: https://firebase.google.com/docs/cloud-messaging
[firebase_cloud_messaging_rest_api_link]: https://firebase.google.com/docs/cloud-messaging/send-message#rest_3
[google_oauth2_playground_link]: https://developers.google.com/oauthplayground
[workflow_link]: https://github.com/VGVentures/google_news_template/actions/workflows/main.yaml
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
