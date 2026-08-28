import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:krishi_sutra/app.dart';

void main() {
  testWidgets('Login screen loads at app open', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: KrishiSutraApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Sign in'), findsOneWidget);
    expect(find.text('Continue with your phone'), findsOneWidget);
    expect(find.text('Skip for now'), findsOneWidget);
  });

  testWidgets('Skipping login opens onboarding', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: KrishiSutraApp(),
      ),
    );
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 1800));

    await tester.tap(find.text('Skip for now'));
    await tester.pumpAndSettle();

    expect(find.text('Choose your language'), findsOneWidget);
  });
}
