import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/widget_provider.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.screenX,
    required this.menuWidth,
    required this.menuHeight,
    required this.menuColor,
    required this.menuText,
  });

  final double screenX;
  final double menuWidth;
  final double menuHeight;
  final Color menuColor;
  final String menuText;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: screenX / 2 - 37.5,
      child: InkWell(
        onTap: () {
          //todo clicked menu
          //if ontap is active, invisible menu container
          //create new container, exit, create new canvas
          context.read<WidgetProvider>().isMenuTapActive();
        },
        child: Container(
          width: menuWidth,
          height: menuHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: menuColor),
          child: Align(alignment: Alignment.center, child: Text(menuText)),
        ),
      ),
    );
  }
}
