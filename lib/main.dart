import 'package:flutter/material.dart';
import 'package:hotel_sunshine/providers/hotel_provider.dart';
import 'package:hotel_sunshine/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HotelProvider(),
      child: MaterialApp(
        title: 'Hotel Sunshine',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
