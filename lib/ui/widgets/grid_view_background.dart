import 'package:flutter/material.dart';

class GridViewBackground extends StatefulWidget {
  const GridViewBackground({
    super.key,
  });

  @override
  State<GridViewBackground> createState() => _GridViewBackgroundState();
}

class _GridViewBackgroundState extends State<GridViewBackground> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
      shrinkWrap: true,
      itemCount: 200,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              border: Border.all(width: 0.1, color: Colors.black)),
        );
      },
    );
  }
}
