import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/Controllers/QuestionController.dart';
import 'package:quizapp/constant.dart';
import 'package:quizapp/screens/Quiz/Components/ProgressBar.dart';
import 'package:quizapp/screens/Quiz/Components/QuestionCard.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Obx(
              () => Text.rich(TextSpan(
                text: "Question ${_questionController.questionNumber.value}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: kSecondaryColor),
                children: [
                  TextSpan(
                      text: "/${_questionController.questions.length}",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: kSecondaryColor))
                ])),)
          ),
          
          SizedBox(height: 5),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ProgressBar(),
          ),
          
          
          Divider(
            thickness: 1.5,
            color: kSecondaryColor,
          ),
          SizedBox(height: 5),
          Expanded(
              child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQuestionNumber,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                        question: _questionController.questions[index],
                      ))),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
