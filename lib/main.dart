import 'package:flutter/material.dart';
import 'package:flutter_tindev/screens/home.dart';
import 'package:flutter_tindev/screens/login.dart';
import 'package:flutter_tindev/screens/swiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Roboto',
          bodyColor: Colors.white,
        ),
      ),
      home: SwiperScreen(),
    );
  }
}