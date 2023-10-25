import 'package:draggable_example/ui/widgets/reDragText.dart';
import 'package:flutter/cupertino.dart';

class PrioritizationTableWidget extends StatefulWidget {
  const PrioritizationTableWidget({super.key});

  @override
  State<PrioritizationTableWidget> createState() =>
      _PrioritizationTableWidgetState();
}

class _PrioritizationTableWidgetState extends State<PrioritizationTableWidget> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: ReDragText(getText: "1"),
        ),
        Positioned(
          left: 0,
          top: 160,
          child: ReDragText(getText: "2"),
        ),
        Positioned(
          left: 160,
          top: 0,
          child: ReDragText(getText: "3"),
        ),
        Positioned(
          left: 160,
          top: 160,
          child: ReDragText(getText: "4"),
        ),
      ],
    );
  }
}
