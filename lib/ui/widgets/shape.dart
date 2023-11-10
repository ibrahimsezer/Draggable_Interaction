import 'dart:math';

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
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0x12345678), Color(0x8765F6FF)],
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
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    return path;
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
          color: Colors.grey,
        ));
  }
}

///-----------------------------------------------

class RightArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, size.height / 2);
    path.lineTo(0, size.height / 4);
    path.lineTo(0, 3 * size.height / 4);
    path.close();

    path.moveTo(0, size.height / 4);
    path.lineTo(size.width / 5, size.height / 2);
    path.lineTo(0, 3 * size.height / 4);

    path.moveTo(0, size.height / 4);
    path.lineTo(-50, size.height / 4);
    path.lineTo(-50, 3 * size.height / 4);
    path.lineTo(0, 3 * size.height / 4);
    path.close();

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
