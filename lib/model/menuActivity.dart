import 'package:draggable_example/ui/mainBoard.dart';
import 'package:flutter/material.dart';


class MenuActivity with ChangeNotifier{
  static bool isActive = true;
  MenuActivity();

  Widget openButton(){
    isActive = !isActive;
    notifyListeners();
    print("openButton :$isActive");
    return MenuIconButton(menuIcon: Icons.arrow_upward,buttonPosX: 0).openBottomWidget();
  }
}