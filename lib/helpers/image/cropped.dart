import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class CroppedImage extends StatelessWidget {
  const CroppedImage(
    String assetUrl, {
    required this.width,
    required this.height,
    this.scaleX = 1,
    this.scaleY = 1,
    this.offsetX = 0,
    this.offsetY = 0,
    required this.color,
  })  : assert(assetUrl != null),
        assert(width != null),
        assert(height != null),
        assert(scaleX != null),
        assert(scaleY != null),
        assert(offsetX != null),
        assert(offsetY != null),
        url = assetUrl;

  final String url;
  final double width, height;
  final double scaleX, scaleY;
  final double offsetX, offsetY;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final int width = constraints.maxWidth ~/ scaleX;
      final int height = constraints.maxHeight ~/ scaleY;
      print("WidthX: $width => ${constraints.maxWidth} => $scaleX");
      print("WidthY: $height => ${constraints.maxHeight} => $scaleY");
      return FutureBuilder<ui.Image>(
        future: resizeImage(width, height),
        builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return CustomPaint(
            painter: ImageEditor(
              image: snapshot.requireData,
              offset: Offset(-offsetX * width, -offsetY * height),
            ),
          );
        },
      );
    });
  }

  Future<ui.Image> resizeImage(int width, int height) async {
    final Uint8List m = Uint8List.view((await rootBundle.load(url)).buffer);
    final codec = await ui.instantiateImageCodec(m,
        targetHeight: height, targetWidth: width, allowUpscaling: true);
    final frameInfo = await codec.getNextFrame();
    print("resized image");
    return frameInfo.image;
  }
}

class ImageEditor extends CustomPainter {
  ImageEditor({
    required this.image,
    required this.offset,
  });

  ui.Image image;
  Offset offset;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, offset, Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
