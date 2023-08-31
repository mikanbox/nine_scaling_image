import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nine_scaling_image/nine_scaling_image.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('test the thing', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MediaQuery(
        data: MediaQueryData(size: Size(200, 300)),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: NineScalingImage(assetPath: 'test/sampleimage.png'),
        ),
      ),
    );

    expect(
      find.byType(NineScalingImage), findsOneWidget
    );

  } );
}
