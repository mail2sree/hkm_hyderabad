// ignore_for_file: prefer_const_constructors, file_names, non_constant_identifier_names, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hkm_hyderabad/Screens/Animation/FadeAnimation.dart';
import 'package:hkm_hyderabad/Screens/BottomBar.dart';
import 'package:hkm_hyderabad/Screens/Login/Login.dart';
import 'package:hkm_hyderabad/Screens/Login/Otp.dart';
import 'package:hkm_hyderabad/controllers/auth.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  static String verify = "";

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final phone = TextEditingController();
  bool loading = false;

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
                                      keyboardType: TextInputType.number,
                                      controller: phone,
                                      decoration: InputDecoration(
                                          hintText: "Phone Number",
                                          
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 13, left: 5),
                                            child: Text("+91",
                                                style: TextStyle(fontSize: 15)),
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
                            1.6,
                            GestureDetector(
                              onTap: () async {
                                
                          setState(() {
                            loading = true;
                          });
                          FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber:
                                '+91 ${phone.text}',
                            verificationCompleted:
                                (PhoneAuthCredential credential) {},
                            verificationFailed: (FirebaseAuthException e) {
                              print(e);
                            },
                            codeSent:
                                (String verificationId, int? resendToken) {
                              PhoneLogin.verify = verificationId;
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                          setState(() {
                            loading = false;
                          });
                          Future.delayed(Duration.zero, () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OTP()),
                          );
                          setState(() {
                            loading = false;
                          });
                          });
                              },
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.purple[900]),
                                child: Center(
                                  child: Text(
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
                                      try {
                                        setState(() {
                                          loading = true;
                                        });
                                        try {
                                          await Auth().signInWithGoogle();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => NaviBottomNavBar()));
                                        } catch (e) {
                                          setState(() {
                                          loading = false;
                                          });
                                        }
                                        
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.red.shade600),
                                      child: Center(
                                        child: loading == true  ? Padding(padding: EdgeInsets.all(20.0), child: CircularProgressIndicator(color: Colors.white,),) : Text(
                                          "Google",
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
                                    onTap: () async {
                                      try {
                                        setState(() {
                                          loading = true;
                                        });
                                        try {
                                          await Auth().signInWithFacebook();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => NaviBottomNavBar()));
                                        } catch (e) {
                                          setState(() {
                                          loading = false;
                                          });
                                        }
                                        
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.blue.shade900),
                                      child: Center(
                                        child: loading ? Padding(padding: EdgeInsets.all(20.0), child: CircularProgressIndicator(color: Colors.white,),) : Text(
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
                                                  LoginSplash()));
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.black54),
                                      child: Center(
                                        child: Text(
                                          "Email",
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
