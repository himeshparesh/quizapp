import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/Controllers/QuestionController.dart';
import 'package:quizapp/constant.dart';

class Option extends StatelessWidget {
  const Option({
    Key key,
    this.text,
    this.index,
    this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (questionController) {
          getTheRightColor() {
            if (questionController.isAnswered) {
              if (index == questionController.correctAns) {
                return kGreenColor;
              } else if (index == questionController.selectedAns &&
                  questionController.selectedAns !=
                      questionController.correctAns) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          getTheRightIcon() {
            return  getTheRightColor() == kRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding),
              margin: EdgeInsets.only(top: kDefaultPadding),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: getTheRightColor(),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}. $text",
                    style: TextStyle(color: getTheRightColor(), fontSize: 16),
                  ),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: getTheRightColor() == kGrayColor
                          ? Colors.transparent
                          : getTheRightColor(),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: getTheRightColor()),
                    ),
                    child: getTheRightColor() == kGrayColor ? null :  Icon(
                      getTheRightIcon(),
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
