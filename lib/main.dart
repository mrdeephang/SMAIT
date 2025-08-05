import 'package:flutter/material.dart';
import 'package:smait/splashes/initialsplash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: true,
      title: 'SMAIT',
      theme: ThemeData(fontFamily: "poppins"),
    );
  }
}
