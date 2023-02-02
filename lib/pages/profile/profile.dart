import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  late PageController cont;
  int current = 0;

  @override
  void initState() {
    super.initState();
    cont = PageController(viewportFraction: .85);
    cont.addListener(() {
      int next = cont.page!.round();

      if (current != next) {
        setState(() {
          current = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: wi,
          height: he,
          child: Stack(
            children: [
              //profile-pic
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: "profile",
                  child: Container(
                    margin: EdgeInsets.only(top: wi * .18),
                    width: wi * .25,
                    height: he * .25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.5,
                        color: Colors.blueGrey,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF7c9998).withOpacity(.6),
                          blurRadius: 11,
                          spreadRadius: 1,
                          offset: Offset(2, 2),
                        ),
                      ],
                      image: DecorationImage(
                          image: ExactAssetImage("assets/images/4.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              //profile-name
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: wi * .2,
                  padding: EdgeInsets.symmetric(
                    horizontal: wi * .03,
                    vertical: wi * .002,
                  ),
                  margin: EdgeInsets.only(top: he * .33),
                  decoration: BoxDecoration(
                      color: Color(0xFF7c9998),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    "شایان",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "iran2",
                        fontSize: wi * .08),
                  ),
                ),
              ),
              //profile-main
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: wi,
                  height: he * .52,
                  child: PageView.builder(
                    controller: cont,
                    itemBuilder: (context, index) {
                      bool active = index == current;
                      return buildPage(active, index, wi, he);
                    },
                    itemCount: 10,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//widget-costum for show active or deactive Box main
  buildPage(bool active, int index, double wi, double he) {
    final double blur = active ? 30 : 5;
    final double offset = active ? 10 : 4;
    final double top = active ? wi * .0001 : wi * .3;
    final double rness = active ? .15 : .35;
    final double fsize = active ? wi * .062 : 18;
    final Color shadow = active
        ? Color(0xFF7c9998).withOpacity(.5)
        : Colors.black.withOpacity(.7);

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      margin: EdgeInsets.only(top: top, bottom: 50, left: 15, right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: shadow, blurRadius: blur, offset: Offset(offset, offset))
          ]),
      child: Stack(
        children: [
          //profile-main-pic
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: wi * .05),
              width: wi * .6,
              height: he * .23,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage("assets/images/7.jpg"),
                ),
              ),
            ),
          ),
          //under-profile-main-text
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: wi * .25),
              child: Text(
                'محصول  $index',
                style: TextStyle(
                  fontFamily: "iran2",
                  fontSize: he * .04,
                ),
              ),
            ),
          ),
          //bottom-profile-main-text
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: he * .02),
              child: Text(
                'خریداری شده $index',
                style: TextStyle(
                  fontFamily: "iran2",
                  fontSize: he * .04,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
