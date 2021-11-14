
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khedma/Screens/LandingPage/components/background.dart';
import 'package:khedma/constants.dart';

  class Body extends StatefulWidget {
  @override
  _Body createState()=>_Body();}

  class _Body extends State<Body> {
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
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
      PageView(
        onPageChanged: (int page){
          setState(() {
          currentIndex=page;
          });
        },
        controller: _pageController,
        children: [
          makePage(
            image: 'assets/images/logo.png',
            title: 'Dream Job',
            content: 'There are all kinds of equiments to found your dream job'
          ),
          makePage(
            //  reverse: true,
              image: 'assets/images/image.gif',
              title: 'Dream Job 2 ',
              content: 'There are all kinds of equiments to found your dream job'
          ),
          makePage(
              image: 'assets/images/Layer.svg.png',
              title: 'Dream Job 3 ',
              content: 'There are all kinds of equiments to found your dream job'
          )


        ]
          ),
      Container(
      margin:EdgeInsets.only(bottom: 40),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
            buildIndicator(),
        ),
      )
      ],


      );
  }

  Widget _indicator( bool isActive){
    return AnimatedContainer (
      duration: Duration(milliseconds: 300),
      height: 8,
      width: isActive ?30:8,
      margin: EdgeInsets.only(right: 50,left: 50,bottom: 50),
      decoration: BoxDecoration(
          color: secoundry,
          borderRadius: BorderRadius.circular(5)

      )
      ,
    );
  }
  List <Widget> buildIndicator(){
    List <Widget> indicators=[];
    for(int i=0 ;i<3;i++)
    {
      if(currentIndex ==i)
        {
          indicators.add(_indicator(true));

        }else{
        indicators.add(_indicator(false));

      }
    }
    return indicators;
  }
}

Widget makePage({image , title,content, reverse=false}){
  return Container(
    padding: EdgeInsets.only(left: 50,right: 50),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        !reverse ?
        Column(
          children: [

            SizedBox(
              height: 30,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset(image),
            ),

            SizedBox(
              height: 30,
            ),
          ],
        ): SizedBox(),
        Text(title,style: TextStyle(
          color:primary,
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),
        SizedBox(
          height: 20,
        ),
        Text(content,textAlign:TextAlign.center,style: TextStyle(
            color:primary,

            fontSize: 20,
            fontWeight: FontWeight.w400
        ),),

      ],
    ),
  );
}