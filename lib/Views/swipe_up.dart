import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'steps.dart';
import '../Blocs/receipee_bloc.dart';
import '../Models/receipee.dart';

//Creating the card of feed item which is added in the feed item list
class FeedItemSwiper extends StatefulWidget {
  final List<ReceipeeList> _recepeeList;

  FeedItemSwiper(this._recepeeList);

  @override
  FeedItemSwiperState createState() => FeedItemSwiperState();
}

class FeedItemSwiperState extends State<FeedItemSwiper>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        //_feedCategoryList(_feedCategory),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.80,
            width: MediaQuery.of(context).size.width,// 400,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0)),
                                child: Hero(
                                    tag: widget._recepeeList[index].name,
                                    child: Image(
                                      image: AssetImage('assets/' +
                                          widget._recepeeList[index].imageURL),
                                      fit: BoxFit.fitWidth,
                                    )))),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: Text(
                            widget._recepeeList[index].name,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: Text(
                            widget._recepeeList[index].subtext,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: Text(
                            widget._recepeeList[index].description,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black38),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                            height: 40, // 400,
                        child:ListView.builder(
                            itemBuilder: (BuildContext context, int indexes) {
                              return InkWell(
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, left: 20, right: 20),
                                        child: Text(
                                          widget._recepeeList[index]
                                              .details[indexes].itemname,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 5, left: 20, right: 20),
                                        child: Text(
                                          widget._recepeeList[index]
                                              .details[indexes].quantity,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black38),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ));
                            },
                            itemCount:
                                widget._recepeeList[index].details.length,
                            scrollDirection: Axis.horizontal)),

                        MaterialButton(
                          onPressed: () {
                            _navigateToSteps(index,context,widget._recepeeList);
                          },
                          color: Colors.deepOrangeAccent,
                          textColor: Colors.white,
                          child: Icon(
                            Icons.food_bank,
                            size: 24,
                          ),
                          padding: EdgeInsets.all(16),
                          shape: CircleBorder(),
                        ),

                        Container(
                        height:MediaQuery.of(context).size.height * 0.02,
                )
                      ],
                    ),

                );
              },
              onIndexChanged: (index) {},
              itemCount: widget._recepeeList.length,
              loop: false,
              scrollDirection: Axis.horizontal,
              viewportFraction: 0.75,
              scale: 0.8,
              duration: 5000,
            ),
          ),
        )
      ],
    );
  }

  // Method to navigate to steps page
  void _navigateToSteps(
      int index, BuildContext context, List<ReceipeeList> feedItemList) {
    Navigator.of(context).push(
      PageRouteBuilder<ReceipeeList>(
        pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            ) {
          return StepsPage("Instructions",index, feedItemList);
        },
        transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
            ) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

}
