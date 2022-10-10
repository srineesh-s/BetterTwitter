import 'package:bettertwitter/config/routing/route_names.dart';
import 'package:bettertwitter/main.dart';
import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/screens/authentication/ui/auth_view.dart';
import 'package:bettertwitter/screens/home/bloc/home_bloc.dart';
import 'package:bettertwitter/screens/home/repository/home_rep.dart';
import 'package:bettertwitter/screens/home/ui/home_view.dart';
import 'package:bettertwitter/screens/tweet_detail/ui/tweet_detail_view.dart';
import 'package:bettertwitter/screens/tweet_manipulation/bloc/manipulate_tweet_bloc.dart';
import 'package:bettertwitter/screens/tweet_manipulation/reposiotry/manipulate_tweet_repository.dart';
import 'package:bettertwitter/screens/tweet_manipulation/ui/manipulate_tweet_view.dart';
import 'package:bettertwitter/screens/user_profile/ui/user_profile_view.dart';
import 'package:bettertwitter/screens/user_tweets/bloc/user_tweet_bloc.dart';
import 'package:bettertwitter/screens/user_tweets/repository/user_tweet_rep.dart';
import 'package:bettertwitter/screens/user_tweets/ui/user_tweet_view.dart';
import 'package:bettertwitter/services/auth_service.dart';
import 'package:bettertwitter/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final arguments = settings.arguments;
  switch (settings.name) {
    case RouteNames.login:
      return MaterialPageRoute(builder: (_) => const AuthenticationView());
    case RouteNames.signup:
      return MaterialPageRoute(builder: (_) => const AuthenticationView());

    case RouteNames.tweetDetails:
      return MaterialPageRoute(builder: (_) => const TweetDetailView());
    case RouteNames.home:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case RouteNames.manipulateTweet:
      return MaterialPageRoute(
          builder: (_) => BlocProvider<ManipulateTweetBloc>(
                create: (context) => ManipulateTweetBloc(
                    ManipulateTweetRepository(
                        dbService:
                            DbService(firestore: FirebaseFirestore.instance),
                        authService: AuthService(auth: FirebaseAuth.instance))),
                child: ManipulateTweetView(),
              ));
    case RouteNames.userTweets:
      // final userTweet = settings.arguments as TweetModel;
      return MaterialPageRoute(
          builder: (_) => BlocProvider<UserTweetBloc>(
                create: (context) => UserTweetBloc(UserTweetRepository(
                    dbService: DbService(firestore: FirebaseFirestore.instance),
                    authService: AuthService(auth: FirebaseAuth.instance))),
                child: UserTweetView(),
              ));
    case RouteNames.userProfile:
      return MaterialPageRoute(builder: (_) => const UserProfileView());
    // case RouteNames.userTweets:
    //   return MaterialPageRoute(builder: (_) => const UserTweetView());
    default: // If there is no such named route in the switch statement, e.g. /third we are directing the user to sign in again
      return MaterialPageRoute(builder: (_) => const StartUpView());
  }
}
