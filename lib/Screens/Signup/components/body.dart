import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:khedma/Screens/Login/login_screen.dart';
import 'package:khedma/Screens/Signup/components/background.dart';
import 'package:khedma/Screens/Signup/components/or_divider.dart';
import 'package:khedma/Screens/Signup/components/social_icon.dart';
import 'package:khedma/Screens/Welcome/welcome_screen.dart';
import 'package:khedma/Screens/home/home_screen.dart';
import 'package:khedma/components/already_have_an_account_acheck.dart';
import 'package:khedma/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:khedma/components/text_field_container.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../constants.dart';
class Body extends StatefulWidget {

Body({Key key, this.title}) : super(key: key);


final String title;

@override
_BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email= "",username= "",password = "";

  bool pass = false;
  final storage = new FlutterSecureStorage();

  bool processing=false;
  var key = "null";
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SignUp",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.30,
            ),
        TextFieldContainer(
          child: TextField(
            onChanged: (value){
              email = value.trim();

            },


            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: kPrimaryColor,
              ),
              hintText: "Your Email",
              border: InputBorder.none,
            ),
          ),


        ),

            TextFieldContainer(
              child: TextField(
                onChanged: (value){
                  username=value.trim();

                },

                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  hintText: "Username",
                  border: InputBorder.none,
                ),
              ),

            ),
            TextFieldContainer(
              child: TextField(
                controller: controller,
                obscureText: true,
                onChanged: (value){
                  password = value.trim();
                },
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: kPrimaryColor,
                  ),
                  border: InputBorder.none,
                ),
              ),


            ),
             FlutterPwValidator(
              controller: controller,
              minLength: 6,
               uppercaseCharCount: 1,
              width: 400,
              height: 100,

               onSuccess: () {
                 print("Matched");
                 pass = true;
               },

            ),


            processing == false ?RoundedButton(
              text: "SIGNUP",
              press: () {
                bool res = checkemail();
                if(res&pass){
                  registerUser();


                }

              },
            ):CircularProgressIndicator(backgroundColor: Colors.red,),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  void registerUser() async{
    var jsonResponse = null;

    setState(() {
      processing=true;

    });

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var Url = Uri.parse("http://192.168.1.11:8081/api/auth/signup");
    var data = {
      "username":username,
      "email":email,
      "password": password,
    };

        var res = await http.post(Url,
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "username": username,
          "email":email,
          "password": password,
        }));

      print(Url);
      print("data $data");
      jsonResponse = json.decode(res.body);
      print("dddd $jsonResponse");

    if(jsonDecode(res.body) == "email exists"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Username already Associated to existing account",
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
        if(jsonDecode(res.body) == "username exists"){
          print('hahahaah');
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Netwok Error")));

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Username already exists",
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


      }   else{
          Map<String, dynamic> output =
          json.decode(res.body);
          print(output["token"]);
          await storage.write(
              key: "token", value: output["token"]);

          Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
    builder: (context) => LoginScreen(),
    ),
    (route) => false);
    print('token $jsonResponse["token"]');
    sharedPreferences.setString("token", jsonResponse['token']);
    print("hhhhhgg $sharedPreferences");
    /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Account created successfully",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 25.0,
                fontWeight: FontWeight.w300,
                color: Colors.white),
          ),
        ),

        );*/
    /* Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) {
                         return LoginScreen();
                       },
                     ));*/
    //
    //
    //  Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
    }
      setState(() {
        processing=false;
      });
    }


  }
 bool checkemail() {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (((email == "") | (password == ""))|(username == "" )) {
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
    else {
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
    }
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
