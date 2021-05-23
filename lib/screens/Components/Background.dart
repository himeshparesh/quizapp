import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebsafeSvg.asset('assets/background/bg.svg', fit: BoxFit.fitWidth),
        child
      ],
    );
  }
}
