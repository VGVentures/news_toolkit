import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:notifications_client/notifications_client.dart';
import 'package:one_signal_notifications_client/one_signal_notifications_client.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class MockOneSignalUser extends Mock implements OneSignalUser {}

void main() {
  group('OneSignalNotificationsClient', () {
    late OneSignalUser oneSignalUser;
    late OneSignalNotificationsClient oneSignalNotificationsClient;

    const category = 'category';

    setUp(() {
      oneSignalUser = MockOneSignalUser();
      oneSignalNotificationsClient = OneSignalNotificationsClient(
        oneSignalUser: oneSignalUser,
      );
    });

    group('when OneSignalNotificationsClient.subscribeToCategory called', () {
      test('calls OneSignalUser.addTagWithKey', () async {
        when(
          () => oneSignalUser.addTagWithKey(category, true),
        ).thenAnswer((_) async => {});

        await oneSignalNotificationsClient.subscribeToCategory(category);

        verify(() => oneSignalUser.addTagWithKey(category, true)).called(1);
      });

      test('throws SubscribeToCategoryFailure '
          'when OneSignalUser.addTagWithKey fails', () async {
        when(
          () => oneSignalUser.addTagWithKey(category, true),
        ).thenAnswer((_) async => throw Exception());

        expect(
          () => oneSignalNotificationsClient.subscribeToCategory(category),
          throwsA(isA<SubscribeToCategoryFailure>()),
        );
      });
    });

    group(
      'when OneSignalNotificationsClient.unsubscribeFromCategory called',
      () {
        test('calls OneSignalUser.removeTag', () async {
          when(
            () => oneSignalUser.removeTag(category),
          ).thenAnswer((_) async => {});

          await oneSignalNotificationsClient.unsubscribeFromCategory(category);

          verify(() => oneSignalUser.removeTag(category)).called(1);
        });

        test('throws UnsubscribeFromCategoryFailure '
            'when OneSignalUser.removeTag fails', () async {
          when(
            () => oneSignalUser.removeTag(category),
          ).thenAnswer((_) async => throw Exception());

          expect(
            () =>
                oneSignalNotificationsClient.unsubscribeFromCategory(category),
            throwsA(isA<UnsubscribeFromCategoryFailure>()),
          );
        });
      },
    );
  });
}
