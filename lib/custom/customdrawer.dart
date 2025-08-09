import 'package:flutter/material.dart';
import 'package:smait/screens/login.dart';

class Customdrawer extends StatefulWidget {
  final String name;
  final String email;
  const Customdrawer({super.key, required this.name, required this.email});

  @override
  State<Customdrawer> createState() => _CustomdrawerState();
}

class _CustomdrawerState extends State<Customdrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.black]),
            ),
            accountName: Text(
              widget.name,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            accountEmail: Text(
              widget.email,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),

            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/pfp.png'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: ListTile(
              leading: Icon(Icons.home, size: 30),
              title: Text('Home', style: TextStyle(fontSize: 18)),
              // subtitle: Text('Demo'),
              // isThreeLine: true,
            ),
          ),
          Divider(color: Colors.grey),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.description, size: 30),
              title: Text('Chat', style: TextStyle(fontSize: 18)),
              // subtitle: Text('Demo'),
              // isThreeLine: true,
            ),
          ),
          Divider(color: Colors.grey),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.blue,

                  title: Text(
                    'Confirm',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  content: Text(
                    'Are you sure want to LogOut?',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Yes',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),

                      child: Text(
                        'No',
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: ListTile(
              leading: Icon(Icons.logout, size: 30, color: Colors.blue),

              title: Text('Logout', style: TextStyle(fontSize: 18)),
              // subtitle: Text('Demo'),
              // isThreeLine: true,
            ),
          ),

          // subtitle: Text('Demo'),
          // isThreeLine: true,
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.black45, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
