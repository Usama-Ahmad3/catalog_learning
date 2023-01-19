import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/log_in_page.dart';
import 'package:flutter_catalog/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  // ignore: constant_identifier_names
  static const String KEYLOGIN = '';
  @override
  void initState() {
    super.initState();
    func();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.teal.shade200, Colors.lightGreen.shade100])),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 45,
                  fontFamily: 'Crimson',
                  color: Colors.redAccent.shade100),
            ),
            Text(
              '\n Demo Application',
              style: TextStyle(fontSize: 35, color: Colors.redAccent.shade100),
            ),
            const SizedBox(
              height: 30,
            ),
             Image.asset('assets/images/Log_inn.png')
          ],
        ),
      ),
    ));
  }

  void func() async {
    var sharedpref = await SharedPreferences.getInstance();
    var logedin = sharedpref.getBool(KEYLOGIN);
    Timer(const Duration(seconds: 2), () {
      if (logedin != null) {
        if (logedin) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Log_In(),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Log_In(),
              ));
        }
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Log_In(),
            ));
      }
    });
  }
}