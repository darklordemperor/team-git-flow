import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:team_git_flow/main.dart';

void main() {
  testWidgets('renders the starter application', (tester) async {
    final container = ProviderContainer.test();

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MainApp(),
      ),
    );
    await tester.pump();

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(FlutterLogo), findsOneWidget);
  });
}
