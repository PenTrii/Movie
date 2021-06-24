import 'package:demo_getx/screens/details/component/movie_description.dart';
import 'package:flutter/cupertino.dart';

class DetailBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MovieDescription()
          ],
        ),
      ),
    );
  }
}