import 'package:flutter/material.dart';
import 'package:smait/screens/login.dart';
import 'package:smait/services/auth_services.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final authService = AuthService();
  void handleChangePassword() async {
    String? result = await authService.changePassword(
      currentPassword: currentPasswordController.text.trim(),
      newPassword: newPasswordController.text.trim(),
      confirmPassword: confirmPasswordController.text.trim(),
    );
    if (result == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Password updated successfully")));
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
            child: Image.asset('assets/images/forgot.png', fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: currentPasswordController,
                  decoration: InputDecoration(
                    fillColor: Colors.blue,
                    filled: false,
                    hintText: 'Old Password',
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIcon: Icon(Icons.lock),
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
                  controller: newPasswordController,
                  decoration: InputDecoration(
                    fillColor: Colors.blue,
                    filled: false,
                    hintText: 'New Password',
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
                SizedBox(height: 10),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
