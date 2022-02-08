import 'package:flutter/material.dart';
import 'main_content.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.purple),
      home: RandomWords()
    );
  }
  
}

