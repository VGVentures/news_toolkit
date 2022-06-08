import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:news_blocks/news_blocks.dart';
import 'package:news_blocks_ui/src/widgets/widgets.dart';

/// {@template article_introduction}
/// A reusable article introduction block widget.
/// {@endtemplate}
class ArticleIntroduction extends StatelessWidget {
  /// {@macro article_introduction}
  const ArticleIntroduction({
    super.key,
    required this.block,
    required this.premiumText,
    required this.shareText,
    this.onSharePressed,
  });

  /// The associated [ArticleIntroductionBlock] instance.
  final ArticleIntroductionBlock block;

  /// Text displayed when article is premium content.
  final String premiumText;

  /// Text displayed over the share button.
  final String shareText;

  /// An optional callback which is invoked when the share button is pressed.
  final VoidCallback? onSharePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (block.imageUrl != null) InlineImage(imageUrl: block.imageUrl!),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: PostContent(
            categoryName: block.category.name,
            title: block.title,
            author: block.author,
            publishedAt: block.publishedAt,
            premiumText: premiumText,
            isSubscriberExclusive: block.isPremium,
          ),
        ),
        const Divider(),
        if (onSharePressed != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Align(
              alignment: Alignment.centerRight,
              child: ShareButton(
                key: const Key('articleIntroduction_shareButton'),
                shareText: shareText,
                color: AppColors.darkAqua,
                onPressed: onSharePressed,
              ),
            ),
          ),
        const Divider(),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}
