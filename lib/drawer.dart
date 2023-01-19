import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/log_in_page.dart';

// ignore: camel_case_types
class drawer extends StatelessWidget {
  final urlimage =
      'https://images.unsplash.com/photo-1661961110218-35af7210f803?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80';

  const drawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 240,
        backgroundColor: Colors.indigoAccent.shade100,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.green.shade100,
                    Colors.cyan.shade100
                  ])),
                  accountName: const Text('Usama Ahmad'),
                  accountEmail: const Text('12345g@gmail.com'),
                  margin: EdgeInsets.zero,
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(urlimage),
                  ),
                )),
            const ListTile(
              leading: Icon(CupertinoIcons.home),
              title: Text(
                'Home',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Main',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text(
                'Email Me',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                '12345@gmail.com',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Log_In(),
                      ));
                },
                child: const Text(
                  'LogOut',
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
