import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedma/constants.dart';
import 'package:khedma/screens/home/home_content.dart';
import 'package:khedma/screens/home/home_header.dart';
import 'package:khedma/screens/home/home_sub_header.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  final int idUser;
  const HomeScreen({
    Key key,
    @required this.username,
    @required this.idUser,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"+ username);
    print(idUser);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kSpacingUnit * 6),
            HomeHeader(username:username),
            SizedBox(height: kSpacingUnit * 3),
            HomeSubHeader(idUser:idUser,username:username),
            SizedBox(height: kSpacingUnit * 3),
            HomeContent(),
          ],
        ),
      ),
    );
  }
}
