import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    TextEditingController nameCont = TextEditingController();
    // TextEditingController passCont = TextEditingController();

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: he * .18),
        width: wi,
        height: he,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: inputModel(wi, he, nameCont, 25, TextInputType.text,
                    TextInputAction.none, "شماره همراه / ایمیل"),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green[600],
                  ),
                  margin: EdgeInsets.only(
                    top: he * .03,
                    left: wi * .35,
                    right: wi * .35,
                  ),
                  constraints: BoxConstraints(minHeight: he * .06),
                  child: Center(
                    child: Text(
                      'ثبت نام',
                      style: TextStyle(
                        fontFamily: "iran2",
                        fontSize: wi * .06,
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
