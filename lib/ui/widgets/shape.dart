import 'dart:math';

import 'package:draggable_example/ui/widgets/moduler_widget.dart';
import 'package:draggable_example/ui/widgets/oval_text_widget.dart';
import 'package:flutter/material.dart';

class RectangleShapeWidget extends StatelessWidget {
  const RectangleShapeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
      child: TextField(
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {
          FocusScope.of(context).unfocus();
        },
        textAlign: TextAlign.center,
        maxLines: null,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        style: const TextStyle(
            color: Colors.black, fontSize: 20, decoration: TextDecoration.none),
      ),
    );
  }
}

///-----------------------------------------------

class RoundedRectangleShapeWidget extends StatelessWidget {
  const RoundedRectangleShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
          border: Border.all(
            width: 2,
            color: Colors.black,
          )),
      child: TextField(
        textInputAction: TextInputAction.done,
        onSubmitted: (value) {
          FocusScope.of(context).unfocus();
        },
        textAlign: TextAlign.center,
        maxLines: null,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        style: const TextStyle(
            color: Colors.black, fontSize: 20, decoration: TextDecoration.none),
      ),
    );
  }
}

///-----------------------------------------------
class EllipseShapeWidget extends StatelessWidget {
  const EllipseShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: Colors.black,
          )),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: TextField(
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {
                FocusScope.of(context).unfocus();
              },
              textAlign: TextAlign.center,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  decoration: TextDecoration.none),
            ),
          ),
        ),
      ),
    );
  }
}

///-----------------------------------------------

class TriangleShapeWidget extends StatelessWidget {
  const TriangleShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: CustomTriangleClipper(),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.black54,
              border: Border.all(width: 1, color: Colors.black54)),
          child: TextField(
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              FocusScope.of(context).unfocus();
            },
            textAlign: TextAlign.center,
            maxLines: null,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                decoration: TextDecoration.none),
          ),
        ));
  }
}

///-----------------------------------------------
class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.0020000, size.height * -0.0060000);
    path_0.lineTo(size.width * 0.5000000, size.height * 1.0020000);
    path_0.lineTo(size.width, size.height * -0.0040000);
    path_0.lineTo(size.width * 0.0020000, size.height * -0.0060000);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

///-----------------------------------------------
class RightArrowWidget extends StatelessWidget {
  const RightArrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: RightArrowClipper(),
      child: Container(
        color: Colors.orangeAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: TextField(
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {
                FocusScope.of(context).unfocus();
              },
              textAlign: TextAlign.center,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  decoration: TextDecoration.none),
            ),
          ),
        ),
      ),
    );
  }
}

///-----------------------------------------------

class RightArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width / 2, size.height * 3 / 4);
    path.lineTo(0, size.height * 3 / 4);
    path.lineTo(0, size.height * 1 / 4);
    path.lineTo(size.width / 2, size.height * 1 / 4);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 2);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

///-----------------------------------------------

class RhombusShapeWidget extends StatelessWidget {
  const RhombusShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 4,
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
        child: TextField(
          textInputAction: TextInputAction.done,
          onSubmitted: (value) {
            FocusScope.of(context).unfocus();
          },
          textAlign: TextAlign.center,
          maxLines: null,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}

///-----------------------------------------------

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    path.addOval(Rect.fromCircle(center: center, radius: radius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CircleClipper(),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: OvalTextWidget(),
      ),
    );
  }
}

///-----------------------------------------------
class StarClipper extends CustomClipper<Path> {
  int starPoints = 5;

  @override
  Path getClip(Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    Path path = Path();

    double radius = size.width / 2;
    double inner = radius / 2;
    double rotation = pi / 2 * 3;
    double step = pi / starPoints;

    path.lineTo(centerX, centerY - radius);

    for (int i = 0; i < starPoints; i++) {
      double x = centerX + cos(rotation) * radius;
      double y = centerY + sin(rotation) * radius;
      path.lineTo(x, y);
      rotation += step;

      x = centerX + cos(rotation) * inner;
      y = centerY + sin(rotation) * inner;
      path.lineTo(x, y);
      rotation += step;
    }
    path.lineTo(centerX, centerY - radius);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class StarWidget extends StatelessWidget {
  const StarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: StarClipper(),
      child: Container(
        color: Colors.orangeAccent,
        child: OvalTextWidget(),
      ),
    );
  }
}

///-----------------------------------------------
///todo pentagon clipper
class PentagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path
      // ..moveTo(size.width / 2, 0) // moving to topCenter 1st, then draw the path
      ..lineTo(size.width, size.height * .25)
      ..lineTo(size.width, size.height * .75)
      ..lineTo(size.width * .5, size.height)
      ..lineTo(0, size.height * .75)
      ..lineTo(0, size.height * .25)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}

///-----------------------------------------------
class PentagonWidget extends StatelessWidget {
  const PentagonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: PentagonClipper(),
      child: Container(
        color: Colors.orange,
        child: OvalTextWidget(),
      ),
    );
  }
}

///-----------------------------------------------

class HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3316667, size.height * 0.0833333);
    path_0.lineTo(size.width * 0.5866667, size.height * 0.0816667);
    path_0.lineTo(size.width * 0.7500000, size.height * 0.3300000);
    path_0.lineTo(size.width * 0.5833333, size.height * 0.5866667);
    path_0.lineTo(size.width * 0.3316667, size.height * 0.5883333);
    path_0.lineTo(size.width * 0.1616667, size.height * 0.3333333);
    path_0.lineTo(size.width * 0.3316667, size.height * 0.0833333);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

///-----------------------------------------------
class HexagonWidget extends StatelessWidget {
  const HexagonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: HexagonPainter(), child: OvalTextWidget());
  }
}

///-----------------------------------------------
class TrapezoidCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3316667, size.height * 0.0833333);
    path_0.lineTo(size.width * 0.6633333, size.height * 0.0833333);
    path_0.lineTo(size.width * 0.8350000, size.height * 0.7500000);
    path_0.lineTo(size.width * 0.1683333, size.height * 0.7500000);
    path_0.lineTo(size.width * 0.3316667, size.height * 0.0833333);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

///-----------------------------------------------
class TrapezoidWidget extends StatelessWidget {
  const TrapezoidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: TrapezoidCustomPainter(), child: OvalTextWidget());
  }
}

///-----------------------------------------------

class TwinEdgeCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1666667, size.height * 0.0816667);
    path_0.lineTo(size.width * 0.8316667, size.height * 0.0833333);
    path_0.lineTo(size.width * 0.7483333, size.height * 0.5850000);
    path_0.lineTo(size.width * 0.0833333, size.height * 0.5816667);
    path_0.lineTo(size.width * 0.1666667, size.height * 0.0816667);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

///-----------------------------------------------
class TwinedgeWidget extends StatelessWidget {
  const TwinedgeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: TwinEdgeCustomPainter(), child: OvalTextWidget());
  }
}

///-----------------------------------------------
class SmoothTrapezoidCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8333333, size.height * -0.0016667);
    path_0.lineTo(size.width * 0.1658333, size.height * 0.0016667);
    path_0.lineTo(size.width * -0.0050000, size.height * 0.9983333);
    path_0.lineTo(size.width * 1.0008333, size.height);
    path_0.lineTo(size.width * 0.8333333, size.height * -0.0016667);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

///-----------------------------------------------
class SmoothTrapezoidWidget extends StatelessWidget {
  const SmoothTrapezoidWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: SmoothTrapezoidCustomPainter(), child: OvalTextWidget());
  }
}

///-----------------------------------------------
class ChatBubbleCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2165167, size.height * 0.0009833);
    path_0.lineTo(size.width * 0.7767167, size.height * 0.0034667);
    path_0.lineTo(size.width * 0.7729917, size.height * 0.7562000);
    path_0.lineTo(size.width * 0.3461000, size.height * 0.7512333);
    path_0.lineTo(size.width * 0.3129833, size.height * 0.9971500);
    path_0.lineTo(size.width * 0.2794333, size.height * 0.7504333);
    path_0.lineTo(size.width * 0.2202417, size.height * 0.7529000);
    path_0.lineTo(size.width * 0.2165167, size.height * 0.0009833);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

///-----------------------------------------------
class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: ChatBubbleCustomPainter(), child: OvalTextWidget());
  }
}

///-----------------------------------------------
class OctagonCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4188583, size.height * 0.0026667);
    path_0.lineTo(size.width * 0.5824167, size.height * -0.0001000);
    path_0.lineTo(size.width * 0.7080250, size.height * 0.3361167);
    path_0.lineTo(size.width * 0.7088583, size.height * 0.6673333);
    path_0.lineTo(size.width * 0.5842167, size.height * 1.0010667);
    path_0.lineTo(size.width * 0.4196417, size.height * 0.9987833);
    path_0.lineTo(size.width * 0.2905833, size.height * 0.6624833);
    path_0.lineTo(size.width * 0.2923333, size.height * 0.3392833);
    path_0.lineTo(size.width * 0.4188583, size.height * 0.0026667);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

///-----------------------------------------------
class OctagonWidget extends StatelessWidget {
  const OctagonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: OctagonCustomPainter(), child: OvalTextWidget());
  }
}

///-----------------------------------------------
class HorizontalRectangleCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0016667, size.height * -0.0066667);
    path_0.lineTo(size.width * -0.0025000, size.height);
    path_0.lineTo(size.width, size.height * 1.0016667);
    path_0.lineTo(size.width, size.height * -0.0100000);
    path_0.lineTo(size.width * -0.0016667, size.height * -0.0066667);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);

    // Layer 1

    Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paint_stroke_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

///-----------------------------------------------
class HorizontalRectangleWidget extends StatelessWidget {
  const HorizontalRectangleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: HorizontalRectangleCustomPainter(), child: OvalTextWidget());
  }
}
