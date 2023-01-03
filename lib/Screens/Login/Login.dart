// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:hkm_hyderabad/Screens/Animation/FadeAnimation.dart';
import 'package:hkm_hyderabad/Screens/BottomBar.dart';
import 'package:hkm_hyderabad/Screens/Login/Phone.dart';
import 'package:hkm_hyderabad/controllers/auth.dart';

class LoginSplash extends StatefulWidget {
  const LoginSplash({super.key});

  @override
  State<LoginSplash> createState() => _LoginSplashState();
}

class _LoginSplashState extends State<LoginSplash> {
  bool _issecure = true;

  final email = TextEditingController();
  final password = TextEditingController();
  bool loading = false;
  bool google_loading = false;
  bool facebook_loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.purple.shade900,
          Colors.purple.shade800,
          Colors.purple.shade400
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Hare Krishna Golden Temple",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        FadeAnimation(
                            1.4,
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      controller: email,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          hintText: "Email",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextField(
                                      obscureText: _issecure,
                                      autocorrect: false,
                                      controller: password,
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                          suffixIcon: GestureDetector(
                                            child: Icon(_issecure
                                                ? Icons.lock
                                                : Icons.lock_open),
                                            onTap: () {
                                              setState(() {
                                                _issecure = !_issecure;
                                              });
                                            },
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
                            1.5,
                            Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.grey),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
                            1.6,
                            GestureDetector(
                              onTap: () async {
                                try {
                                  setState(() {
                                    loading = true;
                                  });
                                  await Auth().signInWithEmailAndPassword(
                                      email: email.text,
                                      password: password.text);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NaviBottomNavBar()));
                                  setState(() {
                                    loading = false;
                                  });
                                } catch (signUpError) {
                                  setState(() {
                                    loading = true;
                                  });
                                  await Auth().createUserWithEmailAndPassword(
                                      email: email.text,
                                      password: password.text);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NaviBottomNavBar()));
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              },
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.purple[900]),
                                child: Center(
                                  child: loading ? Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: CircularProgressIndicator(color: Colors.white,),
                                  ) : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        FadeAnimation(
                            1.7,
                            Text(
                              "Or",
                              style: TextStyle(color: Colors.grey),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FadeAnimation(
                                  1.8,
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                  loading = false;
                                });
                                      try {
                                        
                                        try {
                                          setState(() {
                                          google_loading = true;
                                        });
                                          await Auth().signInWithGoogle();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                     NaviBottomNavBar()));
                                          setState(() {
                                          google_loading = false;
                                        });
                                        } catch (e) {
                                          setState(() {
                                            google_loading = false;
                                          });
                                        }
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.red.shade600),
                                      child: Center(
                                        child: google_loading
                                            ? Center(
                                                child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child:
                                                    CircularProgressIndicator(
                                                        color: Colors.white),
                                              ))
                                            : Text(
                                                "Google",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: FadeAnimation(
                                  1.9,
                                  GestureDetector(
                                    onTap: () async {
                                      try {
                                        setState(() {
                                          facebook_loading = true;
                                        });
                                        try {
                                          await Auth().signInWithFacebook();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NaviBottomNavBar()));
                                        } catch (e) {
                                          setState(() {
                                            facebook_loading = false;
                                          });
                                        }
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.blue.shade900),
                                      child: Center(
                                        child: facebook_loading
                                            ? Center(
                                                child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child:
                                                    CircularProgressIndicator(
                                                        color: Colors.white),
                                              ))
                                            : Text(
                                          "Facebook",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: FadeAnimation(
                                  1.9,
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PhoneLogin()));
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.green.shade900),
                                      child: Center(
                                        child: Text(
                                          "Phone",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
