import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Function onPressRight;
  final String rightTxt;

  const Header({
    Key key, 
    this.onPressRight, 
    this.rightTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // iconTheme: IconThemeData(
      //   color: Colors.white, //change your color here
      // ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        TextButton(
          onPressed: onPressRight,
          child: Text(
            rightTxt,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
