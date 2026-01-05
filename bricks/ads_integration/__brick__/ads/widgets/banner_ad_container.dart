import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as ads;

/// {@template banner_ad_container}
/// A container widget for displaying banner ads
/// {@endtemplate}
class BannerAdContainer extends StatefulWidget {
  /// {@macro banner_ad_container}
  const BannerAdContainer({
    required this.adUnitId,
    this.size = ads.AdSize.banner,
    super.key,
  });

  /// The ad unit ID for the banner ad
  final String adUnitId;

  /// The size of the banner ad
  final ads.AdSize size;

  @override
  State<BannerAdContainer> createState() => _BannerAdContainerState();
}

class _BannerAdContainerState extends State<BannerAdContainer> {
  ads.BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  Future<void> _loadAd() async {
    // TODO: Implement actual banner ad loading
    // final bannerAd = ads.BannerAd(
    //   adUnitId: widget.adUnitId,
    //   size: widget.size,
    //   request: const ads.AdRequest(),
    //   listener: ads.BannerAdListener(
    //     onAdLoaded: (_) => setState(() => _isLoaded = true),
    //     onAdFailedToLoad: (ad, error) {
    //       ad.dispose();
    //     },
    //   ),
    // );
    // await bannerAd.load();
    // setState(() => _bannerAd = bannerAd);
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded || _bannerAd == null) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: widget.size.width.toDouble(),
      height: widget.size.height.toDouble(),
      child: ads.AdWidget(ad: _bannerAd!),
    );
  }
}
