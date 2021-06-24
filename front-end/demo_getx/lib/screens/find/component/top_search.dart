import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../config.dart';
import '../../../constants.dart';

class TopSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tìm kiếm hàng đầu",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(12),
              color: Colors.black,
            ),),
          SizedBox(height: getProportionateScreenHeight(10)),
          StaggeredGridView.countBuilder(
              padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              crossAxisCount: 3,
              itemBuilder: (context, index) {
                return SearchItem();
              },
            staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,),
        ],
      ),
    );
  }
}

class SearchItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      height: getProportionateScreenWidth(35),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.all(
            Radius.circular(20.0)
        ),
      ),
      child: Text("#My Awesome Border My Awesome Borde My Awesome Borde", style: TextStyle(color: Colors.white),),
    );
  }
}