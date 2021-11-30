import 'package:flutter/material.dart';
import 'package:khedma/Screens/LandingPage/landing_screen.dart';
import 'package:khedma/Screens/Welcome/welcome_screen.dart';
import 'package:khedma/Screens/connectivity_provider.dart';
import 'package:khedma/constants.dart';
import 'package:khedma/Screens/Profile/ProfileScreen.dart';
import 'package:provider/provider.dart';

import 'Screens/NoConnectionInternet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider (
      providers :[
          ChangeNotifierProvider(
              create: (context)=>ConnectivityProvider(),
        child: LandingScreen(),)
      ],


    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khademni',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LandingScreen(),
    ));
  }
}
