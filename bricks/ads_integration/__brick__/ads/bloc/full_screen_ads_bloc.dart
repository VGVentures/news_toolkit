import 'package:ads_consent_client/ads_consent_client.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as ads;

part 'full_screen_ads_event.dart';
part 'full_screen_ads_state.dart';

/// {@template full_screen_ads_bloc}
/// Manages full-screen ads (interstitial and rewarded)
/// {@endtemplate}
class FullScreenAdsBloc
    extends Bloc<FullScreenAdsEvent, FullScreenAdsState> {
  /// {@macro full_screen_ads_bloc}
  FullScreenAdsBloc({
    required AdsConsentClient adsConsentClient,
  })  : _adsConsentClient = adsConsentClient,
        super(const FullScreenAdsState()) {
    on<LoadInterstitialAdRequested>(_onLoadInterstitialAdRequested);
    on<ShowInterstitialAdRequested>(_onShowInterstitialAdRequested);
    on<InterstitialAdDismissed>(_onInterstitialAdDismissed);
  }

  final AdsConsentClient _adsConsentClient;

  Future<void> _onLoadInterstitialAdRequested(
    LoadInterstitialAdRequested event,
    Emitter<FullScreenAdsState> emit,
  ) async {
    final canRequestAds = await _adsConsentClient.canRequestAds();
    if (!canRequestAds) return;

    emit(state.copyWith(isLoadingInterstitial: true));

    // TODO: Implement actual ad loading with Google Mobile Ads
    // Example:
    // await ads.InterstitialAd.load(
    //   adUnitId: 'YOUR_AD_UNIT_ID',
    //   request: const ads.AdRequest(),
    //   adLoadCallback: ads.InterstitialAdLoadCallback(
    //     onAdLoaded: (ad) => add(InterstitialAdLoaded(ad)),
    //     onAdFailedToLoad: (error) => add(InterstitialAdLoadFailed()),
    //   ),
    // );

    emit(state.copyWith(isLoadingInterstitial: false));
  }

  Future<void> _onShowInterstitialAdRequested(
    ShowInterstitialAdRequested event,
    Emitter<FullScreenAdsState> emit,
  ) async {
    if (state.interstitialAd == null) return;

    // TODO: Show the interstitial ad
    // state.interstitialAd?.show();
  }

  Future<void> _onInterstitialAdDismissed(
    InterstitialAdDismissed event,
    Emitter<FullScreenAdsState> emit,
  ) async {
    emit(state.copyWith(interstitialAd: null));
  }
}
