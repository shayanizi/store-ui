import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:wishrec/main.dart';
import 'package:wishrec/models/signupin.dart';
import 'package:wishrec/pages/mainScreen/mainScreen.dart';

class onBoard extends StatefulWidget {
  const onBoard({super.key});

  @override
  State<onBoard> createState() => _onBoardState();
}

class _onBoardState extends State<onBoard> {
  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      width: wi,
      height: he,
      child: IntroViewsFlutter(
        [
          PageViewModel(
            title: Container(
              child: Text("سلام\n\n مده جونی عشقمنه شروع میشود",
                  style: TextStyle(
                    fontFamily: "iran2",
                    fontSize: wi * .1,
                  ),
                  textDirection: TextDirection.rtl),
            ),
            body: Container(
              width: wi,
              height: he,
            ),
            pageColor: Colors.amber,
            bubbleBackgroundColor: Colors.blueGrey,
          ),
          PageViewModel(
            title: Container(
              margin: EdgeInsets.only(top: wi * .05),
              child: Text(
                'مده جونــــــــــــــی عشق منه',
                style: TextStyle(fontFamily: "iran2", fontSize: wi * .1),
              ),
            ),
            body: Container(
              width: wi,
              height: he,
            ),
            pageColor: Colors.blueGrey,
            bubbleBackgroundColor: Colors.black,
            mainImage: Container(
              width: wi * .55,
              // height: wi * .7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage("assets/images/1.jpg"),
                ),
              ),
            ),
          ),
        ],
        doneText: Text(
          "فهمیدم",
          style: TextStyle(fontFamily: "iran2", fontSize: wi * .1),
          textDirection: TextDirection.rtl,
        ),
        onTapDoneButton: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (builder) => signupin(),
            ),
          );
        },
        skipText: Text(
          "رد کن ... ",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: "iran2",
            fontSize: wi * .1,
            color: Colors.black,
          ),
        ),
      ),
    ));
  }
}
