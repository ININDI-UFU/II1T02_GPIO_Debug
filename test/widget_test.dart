import 'package:flutter_test/flutter_test.dart';
import 'package:gpio_debug_slides/main.dart';

void main() {
  testWidgets('App renders without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const SlidesApp());
    await tester.pumpAndSettle();
    expect(find.byType(SlidesApp), findsOneWidget);
  });
}
