import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:app_links_deep_link_client/app_links_deep_link_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppLinks extends Mock implements AppLinks {}

void main() {
  late MockAppLinks appLinks;
  late StreamController<Uri> uriLinkStreamController;

  setUp(() {
    appLinks = MockAppLinks();
    uriLinkStreamController = StreamController<Uri>();
    when(
      () => appLinks.uriLinkStream,
    ).thenAnswer((_) => uriLinkStreamController.stream);
  });

  tearDown(() {
    unawaited(uriLinkStreamController.close());
  });

  group('AppLinksDeepLinkClient', () {
    test('can be instantiated without parameters', () {
      expect(AppLinksDeepLinkClient.new, returnsNormally);
    });
    group('getInitialLink', () {
      test('retrieves the latest link if present', () async {
        final expectedUri = Uri.https('ham.app.test', '/test/path');
        when(appLinks.getInitialLink).thenAnswer(
          (_) => Future.value(expectedUri),
        );

        final client = AppLinksDeepLinkClient(
          appLinks: appLinks,
        );
        final link = await client.getInitialLink();
        expect(link, expectedUri);
      });
    });

    group('deepLinkStream', () {
      test('publishes values received through uriLinkStream', () {
        final expectedUri1 = Uri.https('news.app.test', '/test/1');
        final expectedUri2 = Uri.https('news.app.test', '/test/2');

        final client = AppLinksDeepLinkClient(
          appLinks: appLinks,
        );

        uriLinkStreamController
          ..add(expectedUri1)
          ..add(expectedUri1)
          ..add(expectedUri2)
          ..add(expectedUri1);

        expect(
          client.deepLinkStream,
          emitsInOrder(<Uri>[
            expectedUri1,
            expectedUri1,
            expectedUri2,
            expectedUri1,
          ]),
        );
      });
    });
  });
}
