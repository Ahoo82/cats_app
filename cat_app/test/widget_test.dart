import 'package:flutter_test/flutter_test.dart';

import 'package:cat_app/main.dart';
import 'package:cat_app/config/brand_config.dart';
import 'package:cat_app/models/cat_breed.dart';

void main() {
  testWidgets('App renders without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const CatApp());
    expect(find.text(BrandConfig.appName), findsOneWidget);
  });

  test('Cat breeds list is not empty', () {
    expect(catBreeds.isNotEmpty, true);
    expect(catBreeds.length, greaterThanOrEqualTo(10));
  });

  test('Each breed has required fields', () {
    for (final breed in catBreeds) {
      expect(breed.name.isNotEmpty, true);
      expect(breed.origin.isNotEmpty, true);
      expect(breed.description.isNotEmpty, true);
    }
  });
}
