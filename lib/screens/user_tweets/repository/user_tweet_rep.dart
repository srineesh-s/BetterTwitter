import 'package:bettertwitter/config/constants/db_names.dart';
import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/services/auth_service.dart';
import 'package:bettertwitter/services/firestore_service.dart';

class UserTweetRepository {
  DbService dbService;
  AuthService authService;
  UserTweetRepository({required this.dbService, required this.authService});

//s
  // Future<List<TweetModel>> getUserTweets() async {
  //   try {
  //     List<TweetModel> tweets = [];
  //     var data = await dbService.getDataFromCollection(
  //         collectionName: CollectionNames.tweets);
  //     data.docs.forEach((element) {
  //       tweets.add(TweetModel.fromJson(element.data()));
  //     });
  //     return tweets;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
