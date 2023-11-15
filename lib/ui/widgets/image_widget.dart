import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateImageWidget extends StatefulWidget {
  const CreateImageWidget({super.key, required this.assetName});

  final String assetName;

  @override
  State<CreateImageWidget> createState() => _CreateImageWidgetState();
}

class _CreateImageWidgetState extends State<CreateImageWidget> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
        fit: BoxFit.fill, child: SvgPicture.asset(widget.assetName));
  }
}
