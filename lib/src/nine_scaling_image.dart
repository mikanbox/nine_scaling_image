import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NineScalingImage extends StatelessWidget {
  // 引数登録
  final String assetPath;
  final Size pieceSize;
  final double dstPieceScale;
  final Color centerColor;
  final Widget? child;

  const NineScalingImage({super.key,
    required this.assetPath,
    required this.pieceSize,
    this.dstPieceScale = 1.0,
    this.centerColor = Colors.transparent,
    this.child
  });


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
        future: _loadImage(assetPath),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CustomPaint(
                painter: _NineScalingPainter(image: snapshot.data!,pieceSize: pieceSize, dstPieceScale: dstPieceScale),
                child:
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: pieceSize.height * dstPieceScale,
                    horizontal: pieceSize.width * dstPieceScale
                ),
                child: child,
              )
            );
          } else {
            return const CircularProgressIndicator();
          }
        }
    );
  }

  // ui.Image 型を返す
  Future<ui.Image> _loadImage(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final list = Uint8List.view(data.buffer);
    final codec = await ui.instantiateImageCodec(list);
    final frame = await codec.getNextFrame();
    return frame.image;
  }
}


class _NineScalingPainter extends CustomPainter {
  final ui.Image image;
  final Size pieceSize;
  final double dstPieceScale;
  const _NineScalingPainter({required this.image, required this.pieceSize, required this.dstPieceScale});

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final paint = Paint();
    final imageWidth = image.width.toDouble();
    final imageHeight = image.height.toDouble();

    final pieceWidth = pieceSize.width;
    final pieceHeight = pieceSize.height;

    final List<double >srcWidth  = [0, pieceWidth  , imageWidth  - pieceWidth  , imageWidth];
    final List<double >srcHeight = [0, pieceHeight , imageHeight - pieceHeight , imageHeight];
    final List<double >dstWidth  = [0, pieceWidth * dstPieceScale  , size.width  - pieceWidth * dstPieceScale , size.width];
    final List<double >dstHeight = [0, pieceHeight  * dstPieceScale  , size.height - pieceHeight * dstPieceScale , size.height];
    paint.color = Colors.white;
    paint.isAntiAlias = false;

    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 3; x++) {
        // scr の rect を dst の rect に拡大
        final srcRect = Rect.fromLTRB( srcWidth[x], srcHeight[y], srcWidth[x + 1], srcHeight[y + 1]);
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
