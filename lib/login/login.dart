import 'package:SMAIT_Technology/Home/loginpage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //put image logo here
                Image.asset('assets/images/logo3.png', width: 200, height: 200),
                // Icon(Icons.lock, size: 80, color: color),
                SizedBox(height: 20),
                // Text(
                //   'Welcome',
                //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                // ),
                SizedBox(height: 30),

                // Email Field
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 20),

                // Password Field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: 30),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (emailController.text == "thoklihang.deep@gmail.com" &&
                          passwordController.text == "123456") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Invalid Email or Password'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Login', style: TextStyle(fontSize: 16)),
                  ),
                ),

                SizedBox(height: 15),
                TextButton(onPressed: () {}, child: Text('Forgot Password?')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
