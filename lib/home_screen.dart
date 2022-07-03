// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart' as grad;
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Gradient light = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFDEDEDE)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,);

    Gradient dark = LinearGradient(
      colors: [Color(0x50000000), Color(0xAB000000)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

    Gradient greenToAmber = LinearGradient(
      colors: [Color(0xFF00FF88), Color(0xFF03fcba)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

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
          SizedBox(height: 30),
          Image.asset('assets/logo.png', width: 70, height: 70),
          SizedBox(height: 50),

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
                  color: Colors.transparent,
                  child: grad.GradientText(
                  gradient: light,
                  'Login Successful!',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w800, fontSize: 55))
                  ),
                
                SizedBox(height: 55)
              ]),
            ),
          )
        ],
      ),
    );
  }
}