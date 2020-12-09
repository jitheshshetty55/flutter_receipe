import 'dart:async';
import 'dart:convert';
import '../Data/receipee_api.dart';
import '../Models/receipee.dart';
//Repository used for providing data to FeedBloc
class FeedRepository {
  //instance of FeedRepository for Singleton pattern
  static final FeedRepository _instance = FeedRepository._internalFeedRepo();
  APIProvider _fAPIProvider;
  //creating singleton of FeedRepository
  factory FeedRepository() => _instance;

  FeedRepository._internalFeedRepo() {
    _fAPIProvider = APIProvider();
  }


  Future<List<ReceipeeList>> fetchFeedCategories() =>
      _fAPIProvider.fetchFeedCategories();
}