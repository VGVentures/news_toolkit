import 'package:flutter_test/flutter_test.dart';
import 'package:google_news_template/analytics/analytics.dart';

void main() {
  group('AnalyticsState', () {
    group('AnalyticsInitial', () {
      test('supports value comparisons', () {
        expect(AnalyticsInitial(), AnalyticsInitial());
      });
    });
  });
}
