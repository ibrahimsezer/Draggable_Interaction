import 'package:flutter/material.dart';

class PriorityStatus extends StatelessWidget {
  final String prioTitle;
  // late  Color prioColor = Colors.white;
  List<Color> prioColorList = [
    Colors.green,
    Colors.orangeAccent,
    Colors.red,
    Colors.grey
  ];

  // getColor<Color>(){for(int i = 0; i < prioColorList.length;i++){
  //   prioColor = prioColorList[i];
  //   return prioColor;
  // }
  // }

  PriorityStatus({
    super.key,
    required this.prioTitle,
    // required this.prioColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            // color: getColor(), // Container rengi
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                // Gölge rengi ve opaklık
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(
                    0, 3), // Gölge'nin x ve y yönlü ofset değerleri
              ),
            ],
          ),
          height: 100,
          width: 100,
          child: Column(
            children: [
              Text(prioTitle),
              TextField(
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
            ],
          )),
    );
  }
}
