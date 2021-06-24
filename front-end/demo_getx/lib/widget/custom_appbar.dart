import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../config.dart';

class CustomAppBar extends PreferredSize {
  final double rating;
  final String title;

  CustomAppBar({this.title, @required this.rating});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    TextStyle styleTitle = TextStyle(color: Colors.black);
    return SafeArea(
      child: Row(
        children: [
          SizedBox(
            height: getProportionateScreenWidth(40),
            width: getProportionateScreenWidth(40),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              color: Colors.white,
              padding: EdgeInsets.zero,
              onPressed: () => Get.back(),
              child: SvgPicture.asset(
                "assets/icons/Back ICon.svg",
                height: 15,
              ),
            ),
          ),
          title != null
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 54, right: 40),
                    child: Center(
                        child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: styleTitle,
                    )),
                  ),
                  flex: 1,
                )
              : Spacer(),
          Container(
            padding: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Text(
                  "$rating",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 5),
                SvgPicture.asset("assets/icons/Start Icon.svg"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
