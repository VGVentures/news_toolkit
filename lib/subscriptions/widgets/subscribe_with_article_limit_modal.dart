import 'package:app_ui/app_ui.dart'
    show AppButton, AppSpacing, AppColors, showAppModal;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_news_template/ads/ads.dart';
import 'package:google_news_template/app/app.dart';
import 'package:google_news_template/article/article.dart';
import 'package:google_news_template/generated/generated.dart';
import 'package:google_news_template/l10n/l10n.dart';
import 'package:google_news_template/login/login.dart';

@visibleForTesting
class SubscribeWithArticleLimitModal extends StatefulWidget {
  const SubscribeWithArticleLimitModal({super.key});

  @override
  State<SubscribeWithArticleLimitModal> createState() =>
      _SubscribeWithArticleLimitModalState();
}

class _SubscribeWithArticleLimitModalState
    extends State<SubscribeWithArticleLimitModal> {
  bool _rewardedAdShown = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final isLoggedIn = context
        .select((AppBloc bloc) => bloc.state.status == AppStatus.authenticated);

    return ColoredBox(
      color: AppColors.darkBackground,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppSpacing.lg),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xlg),
              child: Text(
                l10n.subscribeWithArticleLimitModalTitle,
                style: theme.textTheme.headline3?.apply(color: AppColors.white),
              ),
            ),
            const SizedBox(height: AppSpacing.sm + AppSpacing.xxs),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xlg),
              child: Text(
                l10n.subscribeWithArticleLimitModalSubtitle,
                style: theme.textTheme.subtitle1
                    ?.apply(color: AppColors.mediumEmphasisPrimary),
              ),
            ),
            const SizedBox(height: AppSpacing.lg + AppSpacing.lg),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg + AppSpacing.xxs,
              ),
              child: AppButton.redWine(
                key:
                    const Key('subscribeWithArticleLimitModal_subscribeButton'),
                child: Text(l10n.subscribeButtonText),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            if (!isLoggedIn) ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg + AppSpacing.xxs,
                ),
                child: AppButton.outlinedTransparentWhite(
                  key: const Key('subscribeWithArticleLimitModal_logInButton'),
                  child: Text(l10n.subscribeWithArticleLimitModalLogInButton),
                  onPressed: () => showAppModal<void>(
                    context: context,
                    builder: (context) => const LoginModal(),
                    routeSettings: const RouteSettings(name: LoginModal.name),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg + AppSpacing.xxs,
              ),
              child: AppButton.transparentWhite(
                key: const Key(
                  'subscribeWithArticleLimitModal_watchVideoButton',
                ),
                onPressed: _rewardedAdShown
                    ? null
                    : () => setState(() => _rewardedAdShown = true),
                child: !_rewardedAdShown
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.icons.video.svg(),
                          const SizedBox(width: AppSpacing.sm),
                          Text(
                            l10n.subscribeWithArticleLimitModalWatchVideoButton,
                          ),
                        ],
                      )
                    : const SizedBox.square(
                        dimension: 24,
                        child: CircularProgressIndicator(),
                      ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            if (_rewardedAdShown)
              RewardedAd(
                onUserEarnedReward: (ad, reward) => context
                    .read<ArticleBloc>()
                    .add(const ArticleRewardedAdWatched()),
                onDismissed: _hideRewardedAd,
                onFailedToLoad: _hideRewardedAd,
              ),
          ],
        ),
      ),
    );
  }

  void _hideRewardedAd() => setState(() => _rewardedAdShown = false);
}
