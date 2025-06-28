import 'package:SMAIT_Technology/Const/Colors.dart';
import 'package:SMAIT_Technology/Const/Styles.dart';
import 'package:SMAIT_Technology/login/login.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

//765EFC
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    goToHome();
  }

  void goToHome() async {
    await Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/images/logo2.png", width: 200),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(left: 8, top: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    backgroundColor: Colors.amberAccent,
                    strokeWidth: 2.0,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    'Welcome To SMAIT TECHNOLOGY',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              '"Innovative Digital Solutions"',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: regular,
                fontWeight: FontWeight.bold,
                wordSpacing: 1,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
