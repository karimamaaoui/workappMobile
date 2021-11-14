import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}
final _storage = FlutterSecureStorage();
var readToken;

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    readToken=_storage.read(key: "token");
    print("fddddddddddddddddd $readToken");
    return Container(
      child: Text("home "),

    );
  }
}
