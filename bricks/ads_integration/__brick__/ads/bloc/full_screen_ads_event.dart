part of 'full_screen_ads_bloc.dart';

/// Base class for all full screen ads events
abstract class FullScreenAdsEvent extends Equatable {
  const FullScreenAdsEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load an interstitial ad
class LoadInterstitialAdRequested extends FullScreenAdsEvent {
  const LoadInterstitialAdRequested();
}

/// Event to show a loaded interstitial ad
class ShowInterstitialAdRequested extends FullScreenAdsEvent {
  const ShowInterstitialAdRequested();
}

/// Event when interstitial ad is dismissed
class InterstitialAdDismissed extends FullScreenAdsEvent {
  const InterstitialAdDismissed();
}
