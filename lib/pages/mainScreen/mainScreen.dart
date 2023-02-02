import 'package:flutter/material.dart';
import 'package:wishrec/models/itemDetail.dart';
import 'package:wishrec/pages/about/about.dart';
import 'package:wishrec/pages/checkout/checkout.dart';
import 'package:wishrec/pages/profile/profile.dart';

class mainScreen extends StatefulWidget {
  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int active = 0;
  //key-global-for-tabmenu
  GlobalKey<ScaffoldState> state = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    //main body
    return Scaffold(
      backgroundColor: Color(0xFF7C9998),
      key: state,
      //dashboard<RTL>
      endDrawer: Container(
        width: wi * .25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(wi * .02),
            bottomLeft: Radius.circular(wi * .02),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 15,
              spreadRadius: 1,
              offset: Offset(-2, 0),
            ),
          ],
        ),
        //Ui-dashboard<acc-cart-info>RTL
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            iziIconbar(he, Icons.person_outline, 1),
            iziIconbar(he, Icons.shopping_bag_rounded, 2),
            iziIconbar(he, Icons.priority_high, 3),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          width: wi,
          height: he,
          child: ListView(
            children: [
              //Row1-TEXT&Dashboard
              Container(
                height: he * .15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: wi * .09),
                        child: Text(
                          ' لوگو',
                          style: TextStyle(
                              fontFamily: "iran2", fontSize: wi * .06),
                        )),
                    //key-dashboard
                    Container(
                      margin: EdgeInsets.only(right: wi * .07),
                      child: InkWell(
                        onTap: () {
                          if (state.currentState!.isEndDrawerOpen) {
                          } else {
                            state.currentState!.openEndDrawer();
                          }
                        },
                        child: Icon(
                          Icons.dehaze_rounded,
                          size: wi * .05,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //Row2-SearchBar
              Container(
                constraints: BoxConstraints(minHeight: he * .09),
                margin: EdgeInsets.symmetric(horizontal: wi * .05),
                padding: EdgeInsets.only(
                    left: wi * .03,
                    right: wi * .03,
                    top: wi * .02,
                    bottom: wi * .01),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(wi * .04),
                    color: Colors.white24),
                child: TextField(
                  cursorColor: Colors.blueGrey[800],
                  // maxLength: 2,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(wi * .04),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(wi * .04),
                    ),
                    labelText: 'جستجو',
                    labelStyle: TextStyle(
                        fontSize: wi * .08,
                        color: Colors.white,
                        fontFamily: "iran2"),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              //Row3-tabbar-main
              Container(
                // constraints: BoxConstraints(minHeight: he * .1),
                height: he * .07,
                margin: EdgeInsets.only(
                  top: he * .03,
                  left: wi * .05,
                  right: wi * .05,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          active = index;
                        });
                        print(index);
                      },
                      child: Container(
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.symmetric(horizontal: wi * .02),
                        constraints: BoxConstraints(minWidth: wi * .15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: active == index
                              ? Colors.white24
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            index == 0 ? "همه" : "'مورد $index'",
                            style: TextStyle(
                                color: active == index
                                    ? Colors.white
                                    : Colors.blueGrey[800],
                                fontFamily: "iran2",
                                fontSize: he * .035),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 11,
                ),
              ),
              //Row4-bottom-scroll-tab
              Container(
                margin: EdgeInsets.only(
                  top: he * .03,
                ),
                height: he * .56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(he * .04),
                    topRight: Radius.circular(he * .04),
                  ),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        left: wi * .07,
                        right: wi * .07,
                        top: he * .05,
                      ),
                      height: wi * .66,
                      width: wi * .8,
                      decoration: BoxDecoration(
                          color: index.isEven
                              ? Colors.yellow[600]
                              : Color(0xFF7C9998),
                          borderRadius: BorderRadius.circular(he * .03),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.3),
                              blurRadius: 8,
                              spreadRadius: .4,
                              offset: Offset(2, 4),
                            ),
                          ]),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => itemDetail(
                                  productCat: "نمونه  $index",
                                  productName: "لیست نمونه ها $index",
                                  productPrice: " ریال"),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: wi * .0091),
                              width: wi,
                              height: he,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(he * .023),
                                  bottomLeft: Radius.circular(he * .023),
                                  bottomRight: Radius.circular(he * .03),
                                  topRight: Radius.circular(he * .03),
                                ),
                              ),
                            ),
                            Container(
                              width: wi,
                              height: he,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    constraints:
                                        BoxConstraints(minWidth: wi * .25),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          child: Text(
                                            'فهرست نمونه ها $index',
                                            style: TextStyle(
                                              fontSize: wi * .043,
                                              color: Colors.grey[800],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'نمونه $index',
                                            style: TextStyle(
                                                color: Colors.blueGrey[800]),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            'ریال',
                                            style: TextStyle(
                                              fontSize: wi * .038,
                                              color: index.isEven
                                                  ? Colors.yellow[600]
                                                  : Color(0xFF7C9998),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: he * .36,
                                    width: wi * .4,
                                    // constraints:
                                    //     BoxConstraints(minWidth: wi * .2),
                                    margin: EdgeInsets.only(right: wi * .03),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: ExactAssetImage(
                                                'assets/images/6.jpg'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(wi * .03))),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iziIconbar(var he, IconData icon, int index) {
    return InkWell(
        onTap: () {
          if (index == 1) {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (a, b, c) => profile(),
                transitionDuration: Duration(seconds: 1),
              ),
            );
          } else if (index == 2) {
            Navigator.of(context).pop();

            Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => checkout()));
          } else {
            Navigator.of(context).pop();

            Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => about()));
          }
        },
        child: index != 1
            ? Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: he * .09),
                decoration: BoxDecoration(
                    color: Color(0xFF7C9998), shape: BoxShape.circle),
                child: Icon(
                  icon,
                  color: Colors.white70,
                ),
              )
            : Hero(
                tag: "profile",
                child: Container(
                  width: he * .065,
                  height: he * .065,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: he * .09),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          // fit: BoxFit.cover,
                          image: ExactAssetImage("assets/images/4.jpg"),
                          fit: BoxFit.cover),
                      color: Color(0xFF7C9998),
                      shape: BoxShape.circle),
                ),
              ));
  }
}
