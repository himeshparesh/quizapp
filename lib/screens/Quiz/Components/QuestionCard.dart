import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/Controllers/QuestionController.dart';
import 'package:quizapp/Modals/Questions.dart';
import 'package:quizapp/constant.dart';
import 'package:quizapp/screens/Quiz/Components/Option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    @required this.question,
  }) : super(key: key);

  final Question question;

  

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());

    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: kBlackColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
              question.options.length,
              (index) => Option(
                    index: index,
                    text: question.options[index],
                    press: () => _controller.checkAns(question, index),
                  ))
        ],
      ),
    );
  }
}
