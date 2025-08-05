import 'package:flutter/material.dart';
import 'package:smait/screens/login.dart';

class Customdrawer extends StatefulWidget {
  const Customdrawer({super.key});

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
              "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              ' Welcome',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: Icon(
              Icons.waving_hand,
              size: 90,
              color: Colors.white,
            ),
            // currentAccountPicture: CircleAvatar(
            //   backgroundImage: AssetImage('assets/images/pfp.jpg'),
            // ),
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
