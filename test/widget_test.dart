import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:professional_practice_flutter_android/main.dart';

void main() {
  testWidgets('shows professional practice Android page', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProfessionalPracticeAndroidApp());

    expect(find.text('专业实践 Android 真机运行'), findsOneWidget);
    expect(find.text('小组成员与分工'), findsOneWidget);

    await tester.drag(find.byType(Scrollable), const Offset(0, -700));
    await tester.pumpAndSettle();

    expect(find.text('Android 真机运行任务'), findsOneWidget);
    expect(find.text('真机照片证据要求'), findsOneWidget);
  });
}
