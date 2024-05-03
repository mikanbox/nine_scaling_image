import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nine_scaling_image/nine_scaling_image.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Instantiate widget with 0 pieceSize', (WidgetTester tester) async {
    await tester.pumpWidget(
      const NineScalingImage(assetPath: 'test/sampleimage.png', pieceSize: Size.zero),
    );

    final NineScalingImage obj = tester.widget(find.byType(NineScalingImage));
    expect(obj.pieceSize, Size.zero);
  });

  // testWidgets('Instantiate widget with child widget', (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     const NineScalingImage(assetPath: 'test/sampleimage.png', pieceSize: Size(3,3),
  //     child: SizedBox(),
  //     ),
  //   );
  //
  //   final NineScalingImage obj = tester.widget(find.byType(NineScalingImage));
  //   expect(obj.child., const SizedBox());
  // });



}
