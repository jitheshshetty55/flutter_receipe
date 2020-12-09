import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/receipee.dart';
import 'package:flutter/material.dart';

//chethan.rao@lenskart.in
// Class used for providing data from server for all feed related objects
class APIProvider{
  //Fetching the feed categories from fire store
  Future<List<ReceipeeList>> fetchFeedCategories() async {
    http.Response response = await http
        .get("https://firebasestorage.googleapis.com/v0/b/lenskart-hop.appspot.com/o/recipes.json?alt=media&token=2284c025-7c53-431e-8b1b-3af937b48945")
        .timeout(Duration(seconds: 30),onTimeout:()=>throw Exception);

    if (response.statusCode == 200) {
      if (response.body.toString().trim().length > 2) {
        //Decoding and parsing the json to FeedCategory model
        var responseData = jsonDecode(response.body);

        var documents = responseData as List;
        return documents
            .map((document) => ReceipeeList.fromJSON(document))
            .toList();
      } else {
        return List<ReceipeeList>();
      }
    } else {
      // If service call was not successful, throw an error.
      throw Exception("Invalid response from server");
    }
  }
}