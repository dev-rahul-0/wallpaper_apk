import 'package:flutter/material.dart';

import 'category.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper Apps',
      theme: ThemeData(

        primaryColor: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
