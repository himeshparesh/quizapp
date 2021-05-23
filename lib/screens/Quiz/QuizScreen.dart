import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/Controllers/QuestionController.dart';
import 'package:quizapp/screens/Components/Background.dart';
import 'package:quizapp/screens/Components/Header.dart';
import 'package:quizapp/screens/Quiz/Components/Body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Header(
            rightTxt: 'Skip',
            onPressRight: _controller.nextQuestion,
          ),
        ),
        body: Background(
          child: Body(),
        ));
  }
}
