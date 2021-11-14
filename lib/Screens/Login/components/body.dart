import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:khedma/Screens/Home.dart';
import 'package:khedma/Screens/Login/components/background.dart';
import 'package:khedma/Screens/Signup/signup_screen.dart';
import 'package:khedma/Screens/Welcome/welcome_screen.dart';
import 'package:khedma/components/already_have_an_account_acheck.dart';
import 'package:khedma/components/rounded_button.dart';
import 'package:khedma/components/rounded_input_field.dart';
import 'package:khedma/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;



class Body extends StatefulWidget {

  Body({Key key, this.title}) : super(key: key);


  final String title;



  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String username = "",password = "";
  bool processing=false;
  TextEditingController controller = new TextEditingController();
  final storage = new FlutterSecureStorage();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(


              hintText: "Your Username",
              onChanged: (value) {
                username=value;
              },
            ),



            RoundedPasswordField(
              onChanged: (value) {
                password=value;
              },
            ),
            processing == false? RoundedButton(
              text: "LOGIN",

              press: () {
                bool res = checkusername();
                if(res){
                  userSignIn();
                }

              },
            ):CircularProgressIndicator(backgroundColor: Colors.red),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  void userSignIn() async{
    setState(() {
      processing=true;
    });
    var Url = Uri.parse("http://192.168.1.11:8081/api/auth/signin");
    var response = await http.post(Url,
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "username": username,
          "password": password,
        }));

    print(Url);
    print(jsonDecode(response.body));

    if(jsonDecode(response.body)== "dont have an account"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Create an account before logging in ",
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 25.0,
              fontWeight: FontWeight.w300,
              color: Colors.white),
        ),
      ),

      );
      setState(() {
        processing=false;
      });


    }
    else{
      if(jsonDecode(response.body)=="false"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Incorrect password ",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 25.0,
                fontWeight: FontWeight.w300,
                color: Colors.white),
          ),
        ),
        );
        setState(() {
          processing=false;
        });

      }
      else{
        print(jsonDecode(response.body));
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogContext) {
            return MyAlertDialog(title: 'Backend Response', content: response.body);
          },
        );
        Map<String, dynamic> output =
        json.decode(response.body);
        print(output["accessToken"]);
        await storage.write(
            key: "token", value: output["accessToken"]);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
                (route) => false);

      }
      setState(() {
        processing=false;
      });
    }


  }
  bool checkusername() {
    if ((username == "") | (password == "")) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please fill in all the fields required",
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 25.0,
              fontWeight: FontWeight.w300,
              color: Colors.white),
        ),
      ),
      );
      setState(() {
        processing = false;
      });
      return false;
    }
   /* else {
      if (!emailValid) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please check email format",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 25.0,
                fontWeight: FontWeight.w300,
                color: Colors.white),
          ),
        ),
        );
        setState(() {
          processing = false;
        });
        return false;
      }
    }*/
    return true;
  }
}
class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    this.title,
    this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      actions: this.actions,
      content: Text(
        this.content,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
