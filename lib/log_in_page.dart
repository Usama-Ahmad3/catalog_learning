import 'package:flutter/material.dart';
import 'package:flutter_catalog/main.dart';
import 'package:flutter_catalog/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class Log_In extends StatefulWidget {
  const Log_In({super.key});

  @override
  State<StatefulWidget> createState() => Log_InState();
}

// ignore: camel_case_types
class Log_InState extends State<Log_In> {
  var user = TextEditingController();
  var pass = TextEditingController();
  var result = "";
  var res = "";
  final _formKey = GlobalKey<FormState>();
  bool change = false;
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        change = true;
      });
      await Future.delayed(const Duration(seconds: 3));
      // ignore: use_build_context_synchronously
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Main(),
          ));
      setState(() {
        change = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In Page'),
        leading: const Icon(Icons.account_circle, size: 30, color: Colors.cyan),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('assets/images/Log_inn.png'),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Welcome $result',
                style: const TextStyle(fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "UserName Cannot Be Empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        result = value;
                        setState(() {});
                      },
                      controller: user,
                      decoration: InputDecoration(
                          labelText: 'Enter username',
                          suffixIcon: const Icon(Icons.email_outlined),
                          hintText: 'USAMA AHMAD',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "PassWord Cannot Be Empty";
                        } else if (value.length < 6) {
                          return "Password Length Should At-least Be 6";
                        }
                        return null;
                      },
                      controller: pass,
                      obscureText: true,
                      obscuringCharacter: '#',
                      decoration: InputDecoration(
                          labelText: 'Enter password',
                          suffixIcon: const Icon(Icons.password_outlined),
                          hintText: '123456',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(21),
                          )),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.cyanAccent,
                      child: InkWell(
                        splashColor: Colors.indigoAccent,
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          width: change ? 50 : 150,
                          height: 40,
                          alignment: Alignment.center,
                          duration: const Duration(seconds: 2),
                          child: change
                              ? const Icon(Icons.one_k_plus_rounded)
                              : const Text(
                                  'LogIn',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: TextButton.styleFrom(
                            minimumSize: const Size(150, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            textStyle: const TextStyle(fontSize: 20)),
                        onPressed: () async {
                          var sharedpref =
                              await SharedPreferences.getInstance();
                          sharedpref.setBool(SplashState.KEYLOGIN, true);
                          var username = user.text.toString();
                          var paasword = pass.text.toString();
                          if (username != "" && paasword != "") {
                            await Future.delayed(const Duration(seconds: 2));
                            // ignore: use_build_context_synchronously
                            await Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Main(),
                                ));
                          } else {
                            change = false;
                            res = 'Please Fill All The Fields';
                          }
                          setState(() {});
                        },
                        child: const Text('LogIn')),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      res,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}