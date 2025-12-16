// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:share_launcher/share_launcher.dart';
import 'package:share_plus_platform_interface/share_plus_platform_interface.dart';

class MockSharePlatform extends Mock
    with MockPlatformInterfaceMixin
    implements SharePlatform {}

void main() {
  setUpAll(() {
    registerFallbackValue(ShareParams(text: 'fallback'));
  });
  group('ShareFailure', () {
    test('supports value comparison', () {
      final shareFailure1 = ShareFailure('error');
      final shareFailure2 = ShareFailure('error');
      expect(shareFailure1, equals(shareFailure2));
    });
  });

  group('ShareLauncher', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    test('calls shareProvider with text', () async {
      var called = false;

      final shareLauncher = ShareLauncher(
        shareProvider: (params) async {
          called = true;
          expect(params.text, equals('text'));
          return ShareResult('raw', ShareResultStatus.success);
        },
      );

      await shareLauncher.share(text: 'text');

      expect(called, isTrue);
    });

    test('throws ShareFailure when shareLauncher throws', () async {
      final shareLauncher = ShareLauncher(
        shareProvider: (params) => throw Exception(),
      );

      expect(shareLauncher.share(text: 'text'), throwsA(isA<ShareFailure>()));
    });

    test('calls default ShareProvider with text '
        'when shareProvider not provided ', () async {
      final mock = MockSharePlatform();
      SharePlatform.instance = mock;
      when(
        () => SharePlatform.instance.share(any(that: isA<ShareParams>())),
      ).thenAnswer((_) async => ShareResult('raw', ShareResultStatus.success));

      await ShareLauncher().share(text: 'text');

      verify(() => mock.share(any(that: isA<ShareParams>()))).called(1);
    });
  });
}
