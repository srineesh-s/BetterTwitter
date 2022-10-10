import 'package:bettertwitter/config/constants/db_names.dart';
import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/services/auth_service.dart';
import 'package:bettertwitter/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserTweetRepository {
  DbService dbService;
  AuthService authService;
  UserTweetRepository({required this.dbService, required this.authService});

  Future<List<TweetModel>> getUserTweets() async {
    try {
      List<TweetModel> tweets = [];
      var data = await dbService.getDataFromCollection(
          collectionName: CollectionNames.tweets,
          userId: authService.userFromFirebaseUser.userId);
      data.docs.map((snapshot) => snapshot.data()).forEach((element) {
        tweets.add(TweetModel.fromJson(element as Map<String, dynamic>));
      });
      return tweets;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteUserTweet(TweetModel tweet) async {
    try {
      await dbService.deleteDocument(
          collectionName: CollectionNames.tweets, tweet: tweet.tweet);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
