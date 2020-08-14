import 'package:flutter/material.dart';

import 'dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   ThemeData theme = ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid19 Stats',
    
      theme: theme,
      home: DashBoard(changeTheme: setTheme),
    );
  }

  setTheme(Brightness brightness) {
    if (brightness == Brightness.dark) {
      setState(() {
        theme = ThemeData.dark();
      });
    } else {
      setState(() {
        theme = ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
      });
    }
  }
}
