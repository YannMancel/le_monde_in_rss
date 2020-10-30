import 'package:flutter/material.dart';
import 'package:le_monde_in_rss/widgets/home_widget.dart';

/// Root widget which extends to {StatelessWidget}.
class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calorie App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: Home(title: 'Le Monde'));
  }
}