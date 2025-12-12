import 'package:equatable/equatable.dart';
import 'package:share_plus/share_plus.dart';

/// {@template share_failure}
/// A failure for the share launcher failures.
/// {@endtemplate}
class ShareFailure with EquatableMixin implements Exception {
  /// {@macro share_failure}
  const ShareFailure(this.error);

  /// The error which was caught.
  final Object error;

  @override
  List<Object?> get props => [error];
}

/// ShareProvider is a function type that provides the ability to share content.
typedef ShareProvider = Future<ShareResult> Function(ShareParams);

/// {@template share_launcher}
/// A class allowing opening native share bottom sheet.
/// {@endtemplate}
class ShareLauncher {
  /// {@macro share_launcher}

  ShareLauncher({ShareProvider? shareProvider})
    : _shareProvider = shareProvider ?? SharePlus.instance.share;

  final ShareProvider _shareProvider;

  /// Method for opening native share bottom sheet.
  Future<void> share({required String text}) async {
    try {
      await _shareProvider(ShareParams(text: text));
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(ShareFailure(error), stackTrace);
    }
  }
}
