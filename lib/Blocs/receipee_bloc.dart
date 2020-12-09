import 'dart:async';
import '../Models/receipee.dart';
import '../Data/receipee_repository.dart';
import 'package:flutter/material.dart';
class ReciepeeBloc {

//instance of FeedCategoryBloc for Singleton pattern
  static final ReciepeeBloc _instance =
  ReciepeeBloc._internalFeedCategoryBloc();
  FeedRepository _feedRepository;
  //StreamController for handling the feed categories
  StreamController<List<ReceipeeList>> _feedCategoryStreamController;


  //creating singleton of FeedCategoryBloc
  factory ReciepeeBloc() => _instance;

  ReciepeeBloc._internalFeedCategoryBloc() {
    _feedRepository = FeedRepository();
    _feedCategoryStreamController =
    StreamController<List<ReceipeeList>>.broadcast();
  }

  // Getting the feed items details as stream from _feedCategoryStreamController
  Stream<List<ReceipeeList>> get feedCategories =>
      _feedCategoryStreamController.stream;

  //Fetching the feed categories from Repository and the response is passed into stream
  fetchFeedCategories() {
    print("fetch");
    try {
      _feedRepository.fetchFeedCategories().then((categories) {
        //Updating th stream with latest feed categories
        if (categories.length > 0) {
          _feedCategoryStreamController.sink.add(categories);
        } else {
          //Updating the stream with error that no categories are added.
          _feedCategoryStreamController.sink
              .addError("No category");
        }
      });
    } on Exception catch (exception) {
      //Passing the error to stream for handling exception cases
      _feedCategoryStreamController.sink
          .addError("No Network");
      throw Exception(exception);
    }
  }

}