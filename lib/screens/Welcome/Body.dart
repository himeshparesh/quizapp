import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/constant.dart';
import 'package:quizapp/screens/Quiz/QuizScreen.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: 2),
          Text("Want to play quiz ?",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: kGrayColor, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text("Enter your information below.", style: TextStyle(fontSize: 15)),
          Spacer(),
          TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
                hintText: "Enter your name",
                filled: true,
                fillColor: Color(0xFF1C2341),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          Spacer(),
          InkWell(
            onTap:() => Get.to(QuizScreen()),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: kPrimaryGradient,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(20),
              child: Text("Let's start the quiz",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white, fontSize: 16)),
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    ));
  }
}
