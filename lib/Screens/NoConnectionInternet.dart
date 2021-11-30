import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height : 400,
            width: 300,
            margin: EdgeInsets.fromLTRB(0, 0, 0,25) ,
            decoration:BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/NoInternetConnection.jpg"
                )
              ),
            )
          ),
          Text("No Internet Connection",
            style:TextStyle(
              fontSize:20,
              fontWeight:FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child : Text(
                "You are not connected to the internt Make sure Wi-Fi is on, Airplane Mode is Off",
                style:TextStyle(fontSize:16,color: Colors.blue),
            )
          )
        ],
      )
    );
  }
}
