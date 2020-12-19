import 'package:ecommerce_api/components/applocal.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${getLang(context, "homepage")}"),
      ),
      body: Container(child:Text("${getLang(context , "welcome")}")),
    );
  }
}