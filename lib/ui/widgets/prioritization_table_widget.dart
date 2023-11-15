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
      child: const Stack(
        children: [
        ],
      ),
    );
  }
}
