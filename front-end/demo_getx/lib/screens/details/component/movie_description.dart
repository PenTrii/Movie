import 'package:chewie/chewie.dart';
import 'package:demo_getx/controller/movie_controller.dart';
import 'package:demo_getx/models/movie.dart';
import 'package:demo_getx/widget/custom_loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../config.dart';
import '../../../constants.dart';

class MovieDescription extends GetWidget<MovieDetailController> {

  final MovieDetailController _controller = Get.put(MovieDetailController(params: {"id_movie": Get.parameters['idMovie']}));

  MovieDescription({
    Key key,
    this.pressOnSeeMore,
  }) : super(key: key);

  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        if (_controller.isLoading.value) {
          return CircularIndicator();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenWidth(10),),
            Container(
                width: SizeConfig.screenWidth * 100,
                height: getProportionateScreenHeight(200),
                child: Chewie(controller: _controller.chewieController)),
            SizedBox(height: getProportionateScreenWidth(10),),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: Text(
                _controller.movie.value.title,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  _controller.body = {
                    "id_movie": _controller.movie.value.id
                  };
                  _controller.onPressFavorite();
                },
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  width: getProportionateScreenWidth(64),
                  decoration: BoxDecoration(
                    color: _controller.movie.value.isFavorite  ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Heart Icon_2.svg",
                    color: _controller.movie.value.isFavorite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                    height: getProportionateScreenWidth(16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(64),
              ),
              child:
              ReadMoreText(
                _controller.movie.value.description,
                trimLines: 3,
                trimMode: TrimMode.Line,
                delimiter: '',
                trimCollapsedText: '   Xem tiếp',
                trimExpandedText: '  Thu gọn',
                style: TextStyle(color: Colors.black87),
                moreStyle: TextStyle(fontSize: 12, color: primaryColor),
                lessStyle: TextStyle(fontSize: 12, color: primaryColor),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(20),),
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(15), right: getProportionateScreenWidth(15)),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 9,
                  childAspectRatio: 1,
                ),
                shrinkWrap: true,
                itemCount: _controller.movie.value.video.length,
                itemBuilder: (BuildContext context, int index) {
                  var movie = _controller.movie.value.video[index];
                  return RadioItem(movie, _controller, () => _controller.onPressEpisode(movie.number, movie.url));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class RadioItem extends StatelessWidget {
  final Video _item;
  final MovieDetailController _controller;
  final Function onPress;
  RadioItem([this._item, this._controller, this.onPress]);
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onPress,
      child: Container(
        margin: new EdgeInsets.all(2.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Container(
              height: 35.0,
              width: 35.0,
              child: new Center(
                child: new Text("${_item.number}",
                    style: new TextStyle(
                        color: _controller.number.value == _item.number ? Colors.white : primaryColor,
                        //fontWeight: FontWeight.bold,
                        fontSize: 15.0)),
              ),
              decoration: new BoxDecoration(
                color: _controller.number.value == _item.number ? primaryColor : Colors.white,
                border: new Border.all(
                    width: 1.0,
                    color: Colors.black45),
                borderRadius: const BorderRadius.all(const Radius.circular(70.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
