import 'package:draggable_example/model/widgetModel.dart';
import 'package:draggable_example/ui/pageDraggable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PageDraggable(),
          ),
          ChangeNotifierProvider(
            create: (context) => WidgetFunctions(),
          )
        ],
        child: MaterialApp(
          home: PageDraggable(),
        )));
