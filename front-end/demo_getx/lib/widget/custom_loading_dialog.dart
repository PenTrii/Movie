import 'package:demo_getx/config.dart';
import 'package:demo_getx/constants.dart';
import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  final Color color;

  CircularIndicator({this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight - 200,
      child: Center(
        heightFactor: 1,
        widthFactor: 1,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color ?? primaryColor),
        ),
      ),
    );
  }
}