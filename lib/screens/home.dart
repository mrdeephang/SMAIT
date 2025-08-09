import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smait/custom/customdrawer.dart';
import 'package:smait/services/auth_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Home> {
  final GlobalKey<ScaffoldState> scafolfdKey = GlobalKey<ScaffoldState>();
  final AuthService authService = AuthService();
  String? name;
  String? email;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    String? fetchedName = await authService.getUserName();
    String? fetchedEmail = FirebaseAuth.instance.currentUser?.email;
    setState(() {
      name = fetchedName ?? "User";
      email = fetchedEmail ?? "No email";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafolfdKey,
      appBar: AppBar(
        title: Text(
          'SMAIT',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            scafolfdKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu, color: Colors.white),
        ),
        actions: [Icon(Icons.settings, color: Colors.white)],
        actionsPadding: EdgeInsets.all(15),
      ),
      drawer: Customdrawer(name: name!, email: email!),
      body: Center(child: Text("Welcome")),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => showModalBottomSheet(
          elevation: 5,
          backgroundColor: Colors.blueAccent,
          context: context,
          builder: (context) => Container(
            padding: EdgeInsets.all(100),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Column(
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(height: 20),

                SizedBox(height: 20),
                Card(
                  elevation: 4.0,
                  child: ExpansionTile(
                    title: Text('Services', style: TextStyle(fontSize: 25)),
                    subtitle: Text('Tap to expand'),
                    children: [
                      ListTile(
                        leading: Icon(Icons.web),
                        title: Text('Web Development'),
                      ),
                      ListTile(
                        leading: Icon(Icons.android),
                        title: Text('App Development'),
                      ),
                      ListTile(
                        leading: Icon(Icons.psychology),
                        title: Text('AI/ML'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        child: Icon(Icons.arrow_upward, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
