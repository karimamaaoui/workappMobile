
import 'package:flutter/material.dart';
import 'package:khedma/Screens/LandingPage/components/body.dart';
import 'package:khedma/Screens/Welcome/welcome_screen.dart';
import 'package:khedma/components/rounded_button.dart';
import 'package:khedma/constants.dart';

  class LandingScreen extends StatefulWidget {
  @override
  _LandingScreen createState()=>_LandingScreen();}

  class _LandingScreen extends State<LandingScreen> {
  PageController _pageController;
  int currentIndex=0;
  @override
  void initState(){
  _pageController=PageController(
  initialPage: 0
  );
  super.initState();
  }

  @override
  void dispose (){
  _pageController.dispose();
  super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20,top: 20),
              child:    RaisedButton(
                color: Colors.yellow,
                textColor: Colors.white,
                child: Container(
                child: Text('Skip',style: TextStyle(fontSize: 18,fontFamily: "Brand Bold"),),
                ),
                onPressed: ()async{
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) {
                return WelcomeScreen();
                })
                );})
          )],

      ),
      body: Body(),

    );
  }
}
