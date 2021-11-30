import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedma/Screens/Profile/Steps.dart';
import 'package:khedma/Screens/Profile/user.dart';
import 'package:khedma/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'Profile_information.dart';

class ProfileScreen extends StatelessWidget {
  final int idUser;
  final String username;
  final List<OneUser> users ;
  const ProfileScreen({
    Key key,
    @required this.idUser,
    @required this.username,
    @required this.users


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context,height: 896,
        width: 414,
        allowFontScaling: true);

    var header =Row(
  mainAxisAlignment:MainAxisAlignment.spaceBetween,
  crossAxisAlignment : CrossAxisAlignment.start,
  children: [
    SizedBox(width: kSpacingUnit.w *3),
    Icon(
        LineAwesomeIcons.arrow_left,
        size:ScreenUtil()
            .setSp(kSpacingUnit.w * 3)
    ),
    Expanded(
      child: Column(
        children: [
          Container(
            height: kSpacingUnit.w *12,
            width:  kSpacingUnit.w *15,
            margin: EdgeInsets.only(top:kSpacingUnit.w * 3 ),
            child: Stack(
              children :[
                CircleAvatar(
                  radius: kSpacingUnit.w *6,
                  backgroundImage: AssetImage("assets/images/avatar7.png"),
                ),

                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: kSpacingUnit.w *3.5,
                      width: kSpacingUnit.w *10.5,
                      decoration: BoxDecoration(
                          color:Theme.of(context).accentColor,
                          shape: BoxShape.circle
                      ),
                      child: Icon(
                          LineAwesomeIcons.pen,
                          color:kPrimaryColor,
                          size:ScreenUtil()
                              .setSp(kSpacingUnit.w * 3)
                      ),
                    )
                ),


              ] ,
            ),
          ),
          SizedBox(height: kSpacingUnit.w *2),
          Text("Name :$username"),
          SizedBox(height: kSpacingUnit.w *0.5),
          Text("Email $users:"),
          SizedBox(height: kSpacingUnit.w *2),
          Container(
              height: kSpacingUnit.w * 4,
              width: kSpacingUnit.w *25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSpacingUnit.w *3),
                color:Theme.of(context).accentColor,
              ),
              child:Center(
                child:
                GestureDetector(
                    onTap: () {
                      print("go to stepper screen");
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>StepsScreen(idUser: idUser,)));

                    }, // handle your image tap here

                    child:
                    Text("Upgrade to Pro")
                ),
              )
          )
        ],
      ),
    ),
    Icon(
        LineAwesomeIcons.sun_1,
        size:ScreenUtil()
            .setSp(kSpacingUnit.w * 3)
    ),
    SizedBox(width: kSpacingUnit.w *3),


  ],);

    return Scaffold(
      backgroundColor : kSilverColor,
        body:Column(
          children: [
            SizedBox(height: kSpacingUnit.w *5),
            header,
            Expanded(
              child: ListView(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print("go to profile information screen");
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>ProfileInformation(idUser: idUser,username: username,)));

                    }, // handle your image tap here
                    child: ProfileListItem(
                      icon: LineAwesomeIcons.user_shield,
                      text: 'Privacy',
                    ),
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.question_circle,
                    text: 'Help & Support',
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.cog,
                    text: 'Settings',
                  ),
                  ProfileListItem(
                    icon: LineAwesomeIcons.alternate_sign_out,
                    text: 'Logout',
                    hasNavigation: false,
                  ),
                ],
              ),
            )

          ],

        )
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 4,
      ).copyWith(
        bottom: kSpacingUnit.w * 2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: kSpacingUnit.w * 2.5,
          ),
          SizedBox(width: kSpacingUnit.w * 1.5),
          Text(
            this.text,
            style: kTitleTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              LineAwesomeIcons.angle_right,
              size: kSpacingUnit.w * 2.5,
            ),
        ],
      ),
    );
  }
}
