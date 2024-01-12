import 'dart:math';

import 'package:draggable_example/ui/widgets/moduler_widget.dart';
import 'package:draggable_example/ui/widgets/oval_text_widget.dart';
import 'package:flutter/material.dart';

class RectangleShapeWidget extends StatefulWidget {
  const RectangleShapeWidget({
    super.key,
  });

  @override
  State<RectangleShapeWidget> createState() => _RectangleShapeWidgetState();
}

class _RectangleShapeWidgetState extends State<RectangleShapeWidget> {
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

class RoundedRectangleShapeWidget extends StatefulWidget {
  const RoundedRectangleShapeWidget({super.key});

  @override
  State<RoundedRectangleShapeWidget> createState() =>
      _RoundedRectangleShapeWidgetState();
}

class _RoundedRectangleShapeWidgetState
    extends State<RoundedRectangleShapeWidget> {
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
class EllipseShapeWidget extends StatefulWidget {
  const EllipseShapeWidget({super.key});

  @override
  State<EllipseShapeWidget> createState() => _EllipseShapeWidgetState();
}

class _EllipseShapeWidgetState extends State<EllipseShapeWidget> {
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

class TriangleShapeWidget extends StatefulWidget {
  const TriangleShapeWidget({super.key});
  @override
  State<TriangleShapeWidget> createState() => _TriangleShapeWidgetState();
}

class _TriangleShapeWidgetState extends State<TriangleShapeWidget> {
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
class RightArrowWidget extends StatefulWidget {
  const RightArrowWidget({super.key});

  @override
  State<RightArrowWidget> createState() => _RightArrowWidgetState();
}

class _RightArrowWidgetState extends State<RightArrowWidget> {
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

class RhombusShapeWidget extends StatefulWidget {
  const RhombusShapeWidget({super.key});

  @override
  State<RhombusShapeWidget> createState() => _RhombusShapeWidgetState();
}

class _RhombusShapeWidgetState extends State<RhombusShapeWidget> {
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

class StarWidget extends StatefulWidget {
  const StarWidget({super.key});

  @override
  State<StarWidget> createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget> {
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
class PentagonClipper extends CustomClipper<Path>{
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

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path
      ..moveTo(size.width / 2, 0) // moving to topCenter 1st, then draw the path
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
    return false;
  }
}///-----------------------------------------------
class HexagonWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw  ClipPath(
      clipper: HexagonClipper(),
      child: Container(
        width: 100, /// controll the size and color
        height: 110,
        color: Colors.amber,
      ),
    );
  }}