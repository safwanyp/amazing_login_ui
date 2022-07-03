// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart' as grad;

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Gradient greenToAmber = LinearGradient(
    colors: [Color(0xFF00FF88), Color(0xFF03fcba)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  Gradient dark = LinearGradient(
      colors: [Color(0x50000000), Color(0xAB000000)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String verificationIDReceived = "";

  bool otpCodeVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0x0500FF88), const Color(0xFF000000)],
              begin: const FractionalOffset(0.0, 1.0),
              end: const FractionalOffset(1.0, 0.0))),
      child: Column(
        children: [
          SizedBox(height: 100),
          Material(
              color: Colors.transparent,
              child: grad.GradientText(
                  gradient: greenToAmber,
                  'Login UI by Safwan',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w800, fontSize: 30))),
          SizedBox(
            height: 30,
          ),
          Image.asset('assets/logo.png', width: 70, height: 70),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 400, width: 350,
            //color: Colors.white,
            decoration: BoxDecoration(
                //border: Border.all(color: Colors.lime),
                borderRadius: BorderRadius.all(Radius.circular(40)),
                gradient: dark,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: const Offset(
                      5.0,
                      10.0,
                    ),
                    blurRadius: 30.0,
                    spreadRadius: 2.0,
                  )
                ]),

            padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Column(children: [
                SizedBox(height: 25),
                Material(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  shadowColor: Color(0xFF00FF88),
                  color: Colors.transparent,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: phoneController,
                    autofocus: false,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xFF00FF88))),
                        filled: true,
                        fillColor: Color(0xFF001a13),
                        hintStyle: TextStyle(color: Color(0xFFe3e3e3)),
                        hintText: 'Phone Number',
                        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF00FF88)),
                            borderRadius: BorderRadius.circular(30))
                        // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Color(0xFF00FF88), width: 0.2))
                        ),
                  ),
                ),
                SizedBox(height: 35),
                Visibility(
                  visible: otpCodeVisible,
                  child: Material(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    shadowColor: Color(0xFF00FF88),
                    color: Colors.transparent,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: otpController,
                      autofocus: false,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Color(0xFF00FF88))),
                          filled: true,
                          fillColor: Color(0xFF001a13),
                          hintStyle: TextStyle(color: Color(0xFFe3e3e3)),
                          hintText: 'OTP',
                          contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF00FF88)),
                              borderRadius: BorderRadius.circular(30))
                          // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Color(0xFF00FF88), width: 0.2))
                          ),
                    ),
                  ),
                ),
                SizedBox(height: 55),
                grad.GradientFloatingActionButton.extended(
                    onPressed: () {
                      if (otpCodeVisible) {
                        verifyCode();
                      } else {
                        verifyNumber();
                      }
                    },
                    label: Text(otpCodeVisible?'Login':'Send OTP',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    gradient: greenToAmber)
              ]),
            ),
          )
        ],
      ),
    );
  }

  void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print("Logged in successfully");
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationIDReceived = verificationID;
          otpCodeVisible = true;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }

  void verifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIDReceived, smsCode: otpController.text);
    await auth.signInWithCredential(credential).then((value) {
      print("Logged in successfully!");

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }
}
