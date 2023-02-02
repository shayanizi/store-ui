import 'package:flutter/material.dart';
import 'package:wishrec/models/signin.dart';
import 'package:wishrec/models/signup.dart';
import 'package:wishrec/pages/mainScreen/mainScreen.dart';

class signupin extends StatefulWidget {
  @override
  State<signupin> createState() => _signupinState();
}

class _signupinState extends State<signupin>
    with SingleTickerProviderStateMixin<signupin> {
  late TabController cont;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cont = TabController(length: 2, vsync: this);
    Future.delayed(Duration(seconds: 10)).then((value) => Navigator.of(context)
        .pushReplacement(
            MaterialPageRoute(builder: (builder) => mainScreen())));
  }

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: wi * .2,
                right: wi * .2,
                top: he * .06,
              ),
              height: he * .09,
              decoration: BoxDecoration(
                  border: Border.all(width: wi * .0009, color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(wi * .05)),
              child: TabBar(
                controller: cont,
                tabs: [
                  Tab(
                    text: "ورود",
                  ),
                  Tab(
                    text: "ثبت نام",
                  )
                ],
                indicatorColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.blue,
                labelStyle: TextStyle(
                  fontFamily: "iran2",
                  fontSize: wi * .08,
                ),
                unselectedLabelColor: Colors.blueGrey[800],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: wi * .04),
                child: TabBarView(
                  controller: cont,
                  children: [
                    signin(),
                    signup(),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
