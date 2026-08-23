import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cat_app/data/article_repository.dart';
import 'package:cat_app/data/breed_repository.dart';
import 'package:cat_app/screens/search_screen.dart';

Future<void> pumpSearch(WidgetTester tester) async {
  SharedPreferences.setMockInitialValues({});
  await tester.pumpWidget(
    const MaterialApp(
      locale: Locale('fa', 'IR'),
      supportedLocales: [Locale('fa', 'IR'), Locale('en', 'US')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      home: SearchScreen(),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> searchAndOpen(WidgetTester tester, String query) async {
  await tester.enterText(find.byType(TextField), query);
  await tester.pumpAndSettle();
  final resultCard = find.widgetWithText(InkWell, query);
  expect(
    resultCard,
    findsOneWidget,
    reason: 'no tappable search-result card found for "$query"',
  );
  await tester.tap(resultCard);
  await tester.pumpAndSettle();
}

void main() {
  test(
    'every articleSearchEntries title resolves to a full Article with sections (except the one known ي/ی mismatch)',
    () {
      final knownUnmatched = <String>{'ضدعفونی و انگل‌زدایی'};
      final unexpectedMisses = <String>[];
      final stubs = <String>[];

      for (final entry in BreedRepository.articleSearchEntries) {
        final title = entry['title']!;
        final full = ArticleRepository.byTitle(title);
        if (full == null) {
          if (!knownUnmatched.contains(title)) unexpectedMisses.add(title);
          continue;
        }
        if (!full.hasSections) stubs.add(title);
        expect(full.title, title, reason: 'title mismatch for "$title"');
      }

      expect(
        unexpectedMisses,
        isEmpty,
        reason:
            'search entries with no matching full Article: $unexpectedMisses',
      );
      expect(
        stubs,
        isEmpty,
        reason: 'search entries resolved to a stub (no sections): $stubs',
      );
    },
  );

  testWidgets('Nutrition article opened from search shows full sections', (
    tester,
  ) async {
    await pumpSearch(tester);
    await searchAndOpen(tester, 'بهترین غذاهای خشک برای گربه');
    expect(find.text('چرا غذای خشک مناسب است؟'), findsOneWidget);
  });

  testWidgets('Health article opened from search shows full sections', (
    tester,
  ) async {
    await pumpSearch(tester);
    await searchAndOpen(tester, 'بیماری‌های شایع در گربه‌ها');
    expect(find.text('بیماری‌های داخلی'), findsOneWidget);
  });

  testWidgets('Vaccination article opened from search shows full sections', (
    tester,
  ) async {
    await pumpSearch(tester);
    await searchAndOpen(tester, 'برنامه واکسیناسیون بچه‌گربه');
    expect(find.text('نقشه راه کامل'), findsOneWidget);
  });

  testWidgets('back navigation from an opened search-result article works', (
    tester,
  ) async {
    await pumpSearch(tester);
    await searchAndOpen(tester, 'بهترین غذاهای خشک برای گربه');
    expect(find.text('چرا غذای خشک مناسب است؟'), findsOneWidget);

    final backButton = find.byIcon(Icons.arrow_back_rounded);
    expect(backButton, findsWidgets);
    await tester.tap(backButton.first);
    await tester.pumpAndSettle();

    expect(find.byType(SearchScreen), findsOneWidget);
  });
}
