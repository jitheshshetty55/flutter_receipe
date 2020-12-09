
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Blocs/receipee_bloc.dart';
import '../Models/receipee.dart';
import '../Views/swipe_up.dart';




class receipeeItemList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return reciepeeListState();
  }
}

class reciepeeListState extends State<receipeeItemList>
    with TickerProviderStateMixin {
  ReciepeeBloc _feedItemBloc = ReciepeeBloc();

  @override
  void initState() {
    _feedItemBloc.fetchFeedCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.white,
          height: MediaQuery.of(context).size.height,
                // Stack Layout
          child: Stack(
                    children: <Widget>[
                      // Column Layout
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          //FeedList in selected mode
                          Padding(
                            padding: EdgeInsets.only(
                                top: 90),
                            child: Container(
                                color: Colors.white,
                                height: MediaQuery.of(context).size.height *
                                     0.85,
                                child: StreamBuilder(
                                  stream: _feedItemBloc.feedCategories,
                                  builder: (context,
                                      AsyncSnapshot<List<ReceipeeList>> snapshot) {
                                    if (snapshot.hasData && snapshot.data.length > 0) {
                                      return FeedItemSwiper(snapshot.data);
                                    } else if (snapshot.hasError) {

                                      // No data alert view
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                        ),

                                      );
                                    }else{
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                        ),

                                      );
                                    }
                                    return Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                      ),

                                    );
                                  },
                                )),
                          ),
                        ],
                      ),
                      // App bar
                      Container(
                        height: 100,
                        child: AppBar(
                          leading: new Container(),
                          title: Text("Receipee"),
                          centerTitle: true,
                          backgroundColor: Colors.redAccent,
                          elevation: 0,
                        ),
                      ),
                      // Mode Menu
                    ],
                  )),
    );
  }
}
