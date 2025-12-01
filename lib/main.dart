import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(DiscoverBelfortApp());
}

class DiscoverBelfortApp extends StatelessWidget {
  const DiscoverBelfortApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Discover Belfort",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      //so that the banner does not appear
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
