import 'package:flutter/material.dart';

import '../Blocs/receipee_bloc.dart';
import '../Models/receipee.dart';

class StepsPage extends StatefulWidget {
  final List<ReceipeeList> _recepeeList;
  final String title;
  int index;


  StepsPage(this.title,this.index,this._recepeeList);


  @override
  _stepsPageState createState() => _stepsPageState();
}

class _stepsPageState extends State<StepsPage> {


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
      Row(
      mainAxisSize: MainAxisSize.max,
          children: <Widget>[
          Container(
              padding:
              EdgeInsets.only( left: 20),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width  * 0.35,
              color: Colors.transparent,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0)),
                  child: Hero(
                      tag: widget._recepeeList[widget.index].name,
                      child: Image(
                        image: AssetImage('assets/' +
                            widget._recepeeList[widget.index].imageURL),
                        fit: BoxFit.fitWidth,
                      )))),
            Padding(
              padding:
              EdgeInsets.only( left: 30),
              child: Text(
                widget._recepeeList[widget.index].name,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
  ]),
Container(
  padding:  EdgeInsets.only(top: 10),
    height: MediaQuery.of(context).size.height * 0.70,
      child:ListView.builder(
              itemCount:  widget._recepeeList[widget.index]
                  .steps.length,
              itemBuilder: (context, indexes) {
                return ListTile(
                  title: Text( widget._recepeeList[widget.index]
                      .steps[indexes],style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),),
                );
              },
            ))
      ])//_buildCategoryList(snapshot.data.);



      );
  }
}
