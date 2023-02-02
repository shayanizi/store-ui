// import 'dart:ffi';
// import 'dart:io';

import 'package:flutter/material.dart';

class itemDetail extends StatefulWidget {
  // const itemDetail({super.key});
  String productName;
  String productCat;
  String productPrice;
  itemDetail(
      {required this.productName,
      required this.productCat,
      required this.productPrice});
  @override
  State<itemDetail> createState() => _itemDetailState();
}

List imgLinks = [
  "assets/images/11.jpg",
  "assets/images/12.jpg",
  "assets/images/13.jpg",
  "assets/images/14.jpg",
  "assets/images/15.jpg",
  "assets/images/16.jpg",
];
int avtive = 0;

class _itemDetailState extends State<itemDetail> {
  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: wi,
          height: he,
          // color: Colors.yellow,
          child: Stack(
            children: [
              Align(
                child: Container(
                  alignment: Alignment.topCenter,
                  width: wi,
                  height: he,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: Image.asset(
                    imgLinks[avtive],
                  ),
                ),
              ),
              //bookmarkIcon
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.only(right: wi * .1, top: wi * .1),
                  child: Icon(
                    Icons.bookmark_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              //bottom-main
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: wi,
                  height: he * .5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(wi * .06),
                      topRight: Radius.circular(wi * .06),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: wi * .205,
                          left: wi * .1,
                          right: wi * .1,
                        ),
                        // color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                widget.productCat,
                                style: TextStyle(
                                    fontFamily: "iran2", fontSize: he * .035),
                              ),
                            ),
                            Container(
                              child: Text(
                                widget.productName,
                                style: TextStyle(
                                    fontFamily: "iran2", fontSize: he * .035),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: wi * .1,
                          right: wi * .1,
                          top: wi * .045,
                        ),
                        child: Text(
                          "مسئول خرید مستقیما زیر نظر مدیر بازرگانی انجام وظیفه می کند ومسئولیت خرید کلیه مواد مورد نیاز برای تولید محصول، ارزیابی" +
                              "تامین کنندگان، ارائه گزارش به مدیر بازرگانی و پی گیری وضعیت خرید مواد تا رسیدن به کارخانه را بر عهده دارد.",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: "iran2", fontSize: he * .035),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.symmetric(horizontal: wi * .07),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            style: TextStyle(
                                fontFamily: "iran2", fontSize: he * .035),
                            'ادامه',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //bottom-label
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: wi,
                  height: he * .12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(wi * .05),
                      topRight: Radius.circular(wi * .05),
                    ),
                  ),
                  child: Container(
                    width: wi,
                    height: he,
                    decoration: BoxDecoration(
                      color: Color(0xFF7C9998),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(wi * .05),
                        topRight: Radius.circular(wi * .05),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Text(widget.productPrice,
                              style: TextStyle(color: Colors.white)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: wi * .12),
                          height: he * .07,
                          decoration: BoxDecoration(
                            color: Colors.green[300],
                            borderRadius: BorderRadius.all(
                              Radius.circular(wi * .028),
                            ),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                'خرید',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "iran2",
                                    fontSize: he * .035),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //animated-center
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(bottom: he * .03),
                  width: wi * .8,
                  height: he * .2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(wi * .04),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 226, 226, 226),
                          blurRadius: 9,
                          spreadRadius: 1,
                          offset: Offset(0, 11))
                    ],
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            avtive = index;
                          });
                        },
                        child: AnimatedOpacity(
                          opacity: avtive == index ? 1 : .5,
                          duration: Duration(milliseconds: 500),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: wi * .03, vertical: he * .025),
                            width: wi * .2,
                            // height: he * .04,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage(
                                  imgLinks[index],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: imgLinks.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
