import 'package:flutter/material.dart';
import 'package:quizapp/screens/Components/Background.dart';
import 'package:quizapp/screens/Welcome/Body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
         body: Background(
          child: Body(),
        ),
    );
    
  }
}
