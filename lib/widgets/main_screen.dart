import 'package:flutter/material.dart';
import 'package:le_monde_in_rss/widgets/actuality_screen.dart';

/// A [StatelessWidget] subclass.
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calorie App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: ActualityScreen(title: 'Le Monde'));
  }
}