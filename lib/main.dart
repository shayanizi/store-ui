import 'package:flutter/material.dart';
import 'package:wishrec/models/onBoard.dart';
import 'package:wishrec/models/signupin.dart';
import 'package:wishrec/pages/mainScreen/mainScreen.dart';

// import 'package:angel_framework/angel_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //set method for use another class
      home: main_here(),
      // theme: ThemeData(useMaterial3: true),
    );
  }
}

//use from class _MyAppState
class main_here extends StatefulWidget {
  @override
  State<main_here> createState() => _main_hereState();
}

class _main_hereState extends State<main_here> {
  // int active = 0;
  // //key-global-for-tabmenu
  // GlobalKey<ScaffoldState> state = GlobalKey();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6)).then((value) => Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (builder) => signupin())));
  }

  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    //main body
    return Scaffold(
      body: Container(
        width: wi,
        height: he,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow,
              Colors.red,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: wi * .4),
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                maxRadius: 80,
                backgroundImage: ExactAssetImage(
                  "assets/images/5.jpg",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: wi * .1),
              child: Text(
                'این صرفا قالب است \n  <برای ایده هامون>',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: wi * .08,
                    fontFamily: "iran2"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// error extensions

