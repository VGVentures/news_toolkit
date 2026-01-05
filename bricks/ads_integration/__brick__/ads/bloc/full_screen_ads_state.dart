part of 'full_screen_ads_bloc.dart';

/// {@template full_screen_ads_state}
/// State for managing full-screen ads
/// {@endtemplate}
class FullScreenAdsState extends Equatable {
  /// {@macro full_screen_ads_state}
  const FullScreenAdsState({
    this.interstitialAd,
    this.isLoadingInterstitial = false,
  });

  /// Currently loaded interstitial ad
  final ads.InterstitialAd? interstitialAd;

  /// Whether an interstitial ad is currently loading
  final bool isLoadingInterstitial;

  @override
  List<Object?> get props => [interstitialAd, isLoadingInterstitial];

  /// Creates a copy of this state with the given fields replaced
  FullScreenAdsState copyWith({
    ads.InterstitialAd? interstitialAd,
    bool? isLoadingInterstitial,
  }) {
    return FullScreenAdsState(
      interstitialAd: interstitialAd ?? this.interstitialAd,
      isLoadingInterstitial:
          isLoadingInterstitial ?? this.isLoadingInterstitial,
    );
  }
}
