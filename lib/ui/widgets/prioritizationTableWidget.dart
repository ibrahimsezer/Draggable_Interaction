import 'package:draggable_example/ui/pageDraggable.dart';
import 'package:draggable_example/ui/widgets/noteWidget.dart';
import 'package:flutter/cupertino.dart';

class PrioritizationTableWidget extends StatefulWidget {
  const PrioritizationTableWidget({super.key});

  @override
  State<PrioritizationTableWidget> createState() =>
      _PrioritizationTableWidgetState();
}

class _PrioritizationTableWidgetState extends State<PrioritizationTableWidget> {
  List<String> defaultText = [
    "Şimdi Yap",
    "Sonra Yap",
    "Yapmak İçin Vakit Var",
    "Yapma"
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: NoteWidget(getText: defaultText[0],myid: ++PageDraggable.id),
          ),
          Positioned(
            left: 0,
            top: 160,
            child: NoteWidget(getText: defaultText[1],myid: ++PageDraggable.id),
          ),
          Positioned(
            left: 160,
            top: 0,
            child: NoteWidget(getText: defaultText[2],myid: ++PageDraggable.id),
          ),
          Positioned(
            left: 160,
            top: 160,
            child: NoteWidget(getText: defaultText[3],myid: ++PageDraggable.id),
          ),
        ],
      ),
    );
  }
}
