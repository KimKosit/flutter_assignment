import 'package:flutter/material.dart';
import './ui/home.dart';
import './ui/login.dart';
import './ui/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: 'flutter_assignment',
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/home': (context) => Home(),
        '/register': (context) => Register(),
      },
    );
  }
}
