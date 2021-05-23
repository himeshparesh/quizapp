import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quizapp/Modals/Questions.dart';
import 'package:quizapp/screens/Scores/ScoreScreen.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController _animationController;
  Animation _animation;

  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map((question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index'],
          ))
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns;
  int get correctAns => this._correctAns;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numberOfCorrectAns = 0;
  int get numberOfCorrectAns => this._numberOfCorrectAns;

  @override
  void onInit() {
    // TODO: implement onInit
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numberOfCorrectAns++;

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // to reset the counter
      _animationController.reset();

      // restart it again
      _animationController.forward().whenComplete(nextQuestion);
    }else{
      Get.to(ScoreScreen());
    }

    
  }

  updateTheQuestionNumber(int index) {
    _questionNumber.value = index + 1;
  }
}
