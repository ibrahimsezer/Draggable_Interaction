import 'package:draggable_example/ui/main_board.dart';
import 'package:flutter/material.dart';

class MenuActivity with ChangeNotifier {
  static bool isActive = true;

  MenuActivity();

// Widget openButton() {
//   isActive = !isActive;
//   notifyListeners();
//   return const MenuIconButton(menuIcon: Icons.arrow_upward, buttonPosX: 0)
//       .openBottomWidget();
// }
}
