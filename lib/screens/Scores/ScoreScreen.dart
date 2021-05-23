import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/Controllers/QuestionController.dart';
import 'package:quizapp/constant.dart';
import 'package:quizapp/screens/Components/Background.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());

    return Scaffold(
      body: Background(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "Score: ${_controller.correctAns * 10} / ${_controller.questions.length * 10}",
                  style: Theme.of(context).textTheme.headline4.copyWith(color: kGrayColor),
                  ),
                  
            ],
          ),
        ),
      ),
    );
  }
}
