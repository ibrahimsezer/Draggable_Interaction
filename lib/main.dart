import 'package:draggable_example/pageDraggable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PageDraggable(),
          ),
        ],
        child: MaterialApp(
          home: PageDraggable(),
        )));
