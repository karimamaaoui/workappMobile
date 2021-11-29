import 'package:flutter/material.dart';
import 'package:khedma/constants.dart';

class HomeHeader extends StatelessWidget {
  final String username;

  const HomeHeader({
    Key key,
    @required this.username,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee " + username);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit * 3,
      ),
      child: RichText(
        text: TextSpan(
          style: kHeadingTextStyle,
          children: [
            TextSpan(text: 'Hey '+this.username+' \n'),
            TextSpan(
              text: 'Looking for a Job?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
