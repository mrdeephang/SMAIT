import 'package:flutter/material.dart';
import 'package:smait/screens/login.dart';
import 'package:smait/services/auth_services.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUp> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final authService = AuthService();
  void handleSignup() async {
    String? result = await authService.signUp(
      fullName: fullNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      confirmPassword: confirmPasswordController.text.trim(),
    );
    if (result == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/signup.png', fit: BoxFit.cover),
          ),

          Padding(
            padding: EdgeInsetsGeometry.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    fillColor: Colors.blue,
                    filled: false,
                    hintText: 'Full Name',
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIcon: Icon(Icons.person),
                    // suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                      gapPadding: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.blue,
                    filled: false,
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIcon: Icon(Icons.email),
                    // suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                      gapPadding: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    fillColor: Colors.blue,
                    filled: false,
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIcon: Icon(Icons.lock),
                    suffix: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                      gapPadding: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    fillColor: Colors.blue,
                    filled: false,
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIcon: Icon(Icons.lock),
                    suffix: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                      gapPadding: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => handleSignup(),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an acount?",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        ' Login',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepPurpleAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
