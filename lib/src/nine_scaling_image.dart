import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NineScalingImage extends StatelessWidget {
  final String assetPath;
  final Color centerColor;

  const NineScalingImage({super.key,
    required this.assetPath,
    this.centerColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
        future: _loadImage(assetPath),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CustomPaint(
              painter: NineScalingPainter(image: snapshot.data!),
            );
          } else {
            return const CircularProgressIndicator();
          }
        }
    );
  }

  Future<ui.Image> _loadImage(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final list = Uint8List.view(data.buffer);
    final codec = await ui.instantiateImageCodec(list);
    final frame = await codec.getNextFrame();
    return frame.image;
  }
}


class NineScalingPainter extends CustomPainter {
  final ui.Image image;

  const NineScalingPainter({required this.image});

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final paint = Paint();
    final imageWidth = image.width.toDouble();
    final imageHeight = image.height.toDouble();

    final pieceWidth = imageWidth / 3;
    final pieceHeight = imageHeight / 3;

    final List<double >dstWidth  = [0, imageWidth  , size.width  - imageWidth  , size.width];
    final List<double >dstHeight = [0, imageHeight , size.height - imageHeight , size.height];
    paint.color = Colors.white;
    paint.isAntiAlias = false;

    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        final srcRect = Rect.fromLTRB( x * pieceWidth, y * pieceHeight, (x+1) * pieceWidth, (y + 1) * pieceHeight);
        final Rect dstRect = Rect.fromLTRB( dstWidth[x], dstHeight[y] , dstWidth[x + 1], dstHeight[y + 1]);


        if (x == 1 && y == 1) {
          canvas.drawRect(dstRect, paint);
          continue;
        }
        canvas.drawImageRect(image, srcRect, dstRect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
