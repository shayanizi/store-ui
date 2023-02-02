import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    TextEditingController nameCont = TextEditingController();
    TextEditingController passCont = TextEditingController();

    return Scaffold(
      body: Container(
        width: wi,
        height: he,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: wi,
              height: he * .4,
              // color: Colors.blue[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  inputModel(wi, he, nameCont, 25, TextInputType.emailAddress,
                      TextInputAction.none, "نام کاربری"),
                  inputModel(wi, he, passCont, 50, TextInputType.text,
                      TextInputAction.none, "کلمه عبور"),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green[600],
                      ),
                      margin: EdgeInsets.only(
                        left: wi * .35,
                        right: wi * .35,
                      ),
                      constraints: BoxConstraints(minHeight: he * .06),
                      child: Center(
                        child: Text(
                          'ورود',
                          style: TextStyle(
                            fontFamily: "iran2",
                            fontSize: wi * .08,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputModel(
    var wi,
    var he,
    TextEditingController cont,
    int max,
    TextInputType keytype,
    TextInputAction action,
    String label,
  ) {
    return Container(
      margin: EdgeInsets.only(
        left: wi * .15,
        right: wi * .15,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: cont,
          maxLength: max,
          keyboardType: keytype,
          textInputAction: action,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(wi * .05),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xFF7c9998),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(wi * .05),
              borderSide: BorderSide(
                width: 1,
                color: Color(0xFF7c9998),
              ),
            ),
            labelText: label,
            labelStyle: TextStyle(
                color: Colors.black, fontFamily: "iran2", fontSize: wi * .05),
          ),
          cursorColor: Color(0xFF7c9998),
        ),
      ),
    );
  }
}
