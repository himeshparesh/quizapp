import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quizapp/Controllers/QuestionController.dart';
import 'package:quizapp/constant.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFF3F4768), width: 3)),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            double sec = controller.animation.value;
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth * controller.animation.value,
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Positioned.fill(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding / 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${(sec * 60).round()} Sec"),
                            WebsafeSvg.asset('assets/icons/clock.svg')
                          ],
                        ))),
              ],
            );
          }),
    );
  }
}
