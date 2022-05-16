// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:news_blocks/news_blocks.dart';
import 'package:news_blocks_ui/news_blocks_ui.dart';

import '../../helpers/helpers.dart';

void main() {
  const id = '499305f6-5096-4051-afda-824dcfc7df23';
  const category = PostCategory.technology;
  const author = 'Sean Hollister';
  final publishedAt = DateTime(2022, 3, 9);
  const imageUrl =
      'https://cdn.vox-cdn.com/thumbor/OTpmptgr7XcTVAJ27UBvIxl0vrg='
      '/0x146:2040x1214/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset'
      '/file/22049166/shollister_201117_4303_0003.0.jpg';
  const title = 'Nvidia and AMD GPUs are returning to shelves '
      'and prices are finally falling';

  group('PostLarge', () {
    setUpAll(setUpTolerantComparator);

    testWidgets('renders correctly overlaid', (tester) async {
      final _technologyPostLarge = PostLargeBlock(
        id: id,
        category: category,
        author: author,
        publishedAt: publishedAt,
        imageUrl: imageUrl,
        title: title,
        isContentOverlaid: true,
      );
      await mockNetworkImages(
        () async => tester.pumpContentThemedApp(
          SingleChildScrollView(
            child: Column(
              children: [
                PostLarge(
                  block: _technologyPostLarge,
                  premiumText: 'Premium',
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byKey(Key('postLarge_stack')), findsOneWidget);
    });
  });

  testWidgets('renders correctly in column', (tester) async {
    final _technologyPostLarge = PostLargeBlock(
      id: id,
      category: category,
      author: author,
      publishedAt: publishedAt,
      imageUrl: imageUrl,
      title: title,
    );
    await mockNetworkImages(
      () async => tester.pumpContentThemedApp(
        SingleChildScrollView(
          child: Column(
            children: [
              PostLarge(
                block: _technologyPostLarge,
                premiumText: 'Premium',
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.byKey(Key('postLarge_column')), findsOneWidget);
  });

  testWidgets('onPressed is called with action when tapped', (tester) async {
    final action = BlockAction(type: BlockActionType.navigation);
    final actions = <BlockAction>[];

    final _technologyPostLarge = PostLargeBlock(
      id: id,
      category: category,
      author: author,
      publishedAt: publishedAt,
      imageUrl: imageUrl,
      title: title,
      action: action,
      isContentOverlaid: true,
    );

    await mockNetworkImages(
      () async => tester.pumpContentThemedApp(
        ListView(
          children: [
            PostLarge(
              block: _technologyPostLarge,
              premiumText: 'Premium',
              onPressed: actions.add,
            ),
          ],
        ),
      ),
    );

    await tester.ensureVisible(find.byType(PostLarge));
    await tester.tap(find.byType(PostLarge));

    expect(actions, equals([action]));
  });
}
// TODO(jan-stepien): Update golden tests containing network images
//   testWidgets('renders correctly non-premium', (tester) async {
//     final _technologyPostLarge = PostLargeBlock(
//       id: id,
//       category: category,
//       author: author,
//       publishedAt: publishedAt,
//       imageUrl: imageUrl,
//       title: title,
//     );
//     await mockNetworkImages(
//       () async => tester.pumpContentThemedApp(
//         SingleChildScrollView(
//           child: Column(
//             children: [
//               PostLarge(
//                 block: _technologyPostLarge,
//                 premiumText: 'Premium',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

//     await expectLater(
//       find.byType(PostLarge),
//       matchesGoldenFile('post_large_non_premium.png'),
//     );
//   });

//   testWidgets('renders correctly premium', (tester) async {
//     final premiumBlock = PostLargeBlock(
//       id: id,
//       category: category,
//       author: author,
//       publishedAt: publishedAt,
//       imageUrl: imageUrl,
//       title: title,
//       isPremium: true,
//     );

//     await mockNetworkImages(
//       () async => tester.pumpContentThemedApp(
//         SingleChildScrollView(
//           child: Column(
//             children: [
//               PostLarge(
//                 block: premiumBlock,
//                 premiumText: 'Premium',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

//     await expectLater(
//       find.byType(PostLarge),
//       matchesGoldenFile('post_large_premium.png'),
//     );
//   });

//   testWidgets('renders correctly overlaid view', (tester) async {
//     final _technologyPostLarge = PostLargeBlock(
//       id: id,
//       category: category,
//       author: author,
//       publishedAt: publishedAt,
//       imageUrl: imageUrl,
//       title: title,
//       isContentOverlaid: true,
//     );
//     await mockNetworkImages(
//       () async => tester.pumpContentThemedApp(
//         SingleChildScrollView(
//           child: Column(
//             children: [
//               PostLarge(
//                 block: _technologyPostLarge,
//                 premiumText: 'Premium',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );

//     await expectLater(
//       find.byType(PostLarge),
//       matchesGoldenFile('post_large_overlaid_non_premium.png'),
//     );
//   });
// });
// }
