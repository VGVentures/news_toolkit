import 'package:app_ui/app_ui.dart'
    show AppSpacing, ScrollableColumn, AppColors, AppButton;
import 'package:flutter/material.dart';
import 'package:google_news_template/generated/generated.dart';
import 'package:google_news_template/l10n/l10n.dart';

class MagicLinkPromptView extends StatelessWidget {
  const MagicLinkPromptView({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return ScrollableColumn(
      mainAxisSize: MainAxisSize.min,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.xlg,
        AppSpacing.xlg,
        AppSpacing.xlg,
        AppSpacing.xxlg,
      ),
      children: [
        const MagicLinkPromptHeader(),
        const SizedBox(height: AppSpacing.xxxlg),
        Assets.images.magicLinkPromptEmail.svg(),
        const SizedBox(height: AppSpacing.xxxlg),
        MagicLinkPromptSubtitle(email: email),
        const Spacer(),
        const MagicLinkPromptOpenEmailButton()
      ],
    );
  }
}

@visibleForTesting
class MagicLinkPromptHeader extends StatelessWidget {
  const MagicLinkPromptHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.magicLinkPromptHeader,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}

@visibleForTesting
class MagicLinkPromptSubtitle extends StatelessWidget {
  const MagicLinkPromptSubtitle({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          context.l10n.magicLinkPromptTitle,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyText1,
        ),
        Text(
          email,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyText1?.apply(
            color: AppColors.darkAqua,
          ),
        ),
        const SizedBox(height: AppSpacing.xxlg),
        Text(
          context.l10n.magicLinkPromptSubtitle,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyText1,
        ),
      ],
    );
  }
}

@visibleForTesting
class MagicLinkPromptOpenEmailButton extends StatelessWidget {
  const MagicLinkPromptOpenEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton.darkAqua(
      key: const Key('magicLinkPrompt_openMailButton_appButton'),
      onPressed: () {},
      child: Text(context.l10n.openMailAppButtonText),
    );
  }
}
