import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smait/firebase_options.dart';
import 'package:smait/splashes/initialsplash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      theme: ThemeData(fontFamily: "Poppins"),
    );
  }
}
