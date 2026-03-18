import 'package:notifications_client/notifications_client.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

/// {@template one_signal_notifications_client}
/// OneSignal notifications client.
/// {@endtemplate}
class OneSignalNotificationsClient implements NotificationsClient {
  /// {@macro one_signal_notifications_client}
  OneSignalNotificationsClient({required OneSignalUser oneSignalUser})
    : _oneSignalUser = oneSignalUser;

  /// OneSignal user namespace instance.
  final OneSignalUser _oneSignalUser;

  @override
  Future<void> subscribeToCategory(String category) async {
    try {
      await _oneSignalUser.addTagWithKey(category, true);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(SubscribeToCategoryFailure(error), stackTrace);
    }
  }

  @override
  Future<void> unsubscribeFromCategory(String category) async {
    try {
      await _oneSignalUser.removeTag(category);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        UnsubscribeFromCategoryFailure(error),
        stackTrace,
      );
    }
  }
}
