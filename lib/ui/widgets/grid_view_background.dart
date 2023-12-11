import 'package:flutter/material.dart';

//Old GridBackground
// class GridViewBackground extends StatefulWidget {
//   const GridViewBackground({
//     super.key,
//   });
//
//   @override
//   State<GridViewBackground> createState() => _GridViewBackgroundState();
// }
//
// class _GridViewBackgroundState extends State<GridViewBackground> {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate:
//           const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
//       shrinkWrap: true,
//       itemCount: 200,
//       itemBuilder: (context, index) {
//         return Container(
//           decoration:
//               BoxDecoration(border: Border.all(width: 0.1, color: Colors.grey)),
//         );
//       },
//     );
//   }
// }

class GridBackground extends StatelessWidget {
  const GridBackground({super.key});

  static const int screenXCount = 16; //horizontal screen divide count
  static const int screenYCount = 9; //vertical screen divide count
  static const int screenCount = screenXCount * screenYCount;

  @override
  Widget build(BuildContext context) {
    double screenX = MediaQuery.sizeOf(context).width; //horizontal screen area
    double screenY = MediaQuery.sizeOf(context).height; //vertical screen area
    double containerSizeX = (screenX - 0.001) / screenXCount; //container x size
    double containerSizeY = (screenY - 0.001) / screenYCount; //container y size

    return Wrap(
      direction: Axis.horizontal,
      children: [
        ...List.generate(
            screenCount,
            (index) => Container(
                  width: containerSizeX,
                  height: containerSizeY,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.1, color: Colors.grey),
                  ),
                ))
      ],
    );
  }
}
