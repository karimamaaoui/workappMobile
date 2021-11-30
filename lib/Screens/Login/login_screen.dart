import 'package:flutter/material.dart';
import 'package:khedma/Screens/Login/components/body.dart';
import 'package:provider/provider.dart';

import '../connectivity_provider.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Body(),
    );
  }

}
