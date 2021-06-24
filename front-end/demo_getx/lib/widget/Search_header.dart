import 'package:demo_getx/widget/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import '../constants.dart';

class SearchHeader extends StatelessWidget {

  final Function onPress;

  const SearchHeader({
    Key key, this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          InkWell(
            onTap: onPress,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(12)),
              height: getProportionateScreenWidth(46),
              width: getProportionateScreenWidth(46),
              decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.search, color: Colors.grey,),
            ),
          ),
        ],
      ),
    );
  }
}
