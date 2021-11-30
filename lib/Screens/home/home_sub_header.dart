import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khedma/Screens/Profile/ProfileScreen.dart';
import 'package:khedma/Screens/Profile/Steps.dart';
import 'package:khedma/constants.dart';
import 'package:khedma/widgets/search_control.dart';
import 'package:khedma/widgets/search_tag.dart';

class HomeSubHeader extends StatelessWidget {
  final int idUser;
  final String username;

  const HomeSubHeader({
    Key key,
    @required this.idUser,
    @required this.username,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kSpacingUnit * 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.23),
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            // surffix isn't working properly  with SVG
                            // thats why we use row
                            // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/icons/search.svg"),

                    ],
                  ),
                ),
              ),

              SizedBox(width: kSpacingUnit * 2),
              GestureDetector(
            onTap: () {
              print("click");
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>ProfileScreen(idUser: idUser,username: username,)));

            }, // handle your image tap here
                child:
              CircleAvatar(
                radius: kSpacingUnit * 2,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),),
            ],
          ),
          SizedBox(height: kSpacingUnit * 2),
          SearchTag(tag: 'Tunisia'),
        ],
      ),
    );
  }
}
