import 'package:draggable_example/model/menuActivity.dart';
import 'package:draggable_example/model/widgetModel.dart';
import 'package:draggable_example/ui/mainBoard.dart';
import 'package:draggable_example/ui/widgets/listViewBuilder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MainBoard(),
          ),
          ChangeNotifierProvider(
            create: (context) => WidgetFunctions(),
          ), ChangeNotifierProvider(
            create: (context) => MenuActivity(),
          ),
        ],
        child: MaterialApp(
          home: MainBoard(),
        )));
