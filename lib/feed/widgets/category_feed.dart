import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_news_template/feed/feed.dart';
import 'package:google_news_template/l10n/l10n.dart';
import 'package:google_news_template_api/client.dart';

class CategoryFeed extends StatelessWidget {
  const CategoryFeed({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final categoryFeed =
        context.select((FeedBloc bloc) => bloc.state.feed[category]) ?? [];

    final hasMoreNews =
        context.select((FeedBloc bloc) => bloc.state.hasMoreNews[category]) ??
            true;

    return BlocListener<FeedBloc, FeedState>(
      listener: (context, state) {
        if (state.status == FeedStatus.failure) {
          _handleFailure(context);
        }
      },
      child: ListView.builder(
        itemCount: categoryFeed.length + 1,
        itemBuilder: (context, index) {
          if (index == categoryFeed.length) {
            return hasMoreNews
                ? Padding(
                    padding: EdgeInsets.only(
                      top: categoryFeed.isEmpty ? AppSpacing.xxxlg : 0,
                    ),
                    child: CategoryFeedLoaderItem(
                      key: ValueKey(index),
                      onPresented: () => context
                          .read<FeedBloc>()
                          .add(FeedRequested(category: category)),
                    ),
                  )
                : const SizedBox();
          }

          final block = categoryFeed[index];
          return CategoryFeedItem(block: block);
        },
      ),
    );
  }

  void _handleFailure(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          key: const Key('categoryFeed_failure_snackBar'),
          content: Text(
            context.l10n.unexpectedFailure,
          ),
        ),
      );
  }
}
