import 'package:flutter_test/flutter_test.dart';
import 'package:po_training/main.dart';

void main() {
  testWidgets('App launches smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const POTrainingApp());
    expect(find.text('P&O Training'), findsWidgets);
  });
}
