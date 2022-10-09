import 'package:bettertwitter/config/routing/route_names.dart';
import 'package:bettertwitter/main.dart';
import 'package:bettertwitter/screens/authentication/ui/auth_view.dart';
import 'package:bettertwitter/screens/home/ui/home_view.dart';
import 'package:bettertwitter/screens/tweet_detail/ui/tweet_detail_view.dart';
import 'package:bettertwitter/screens/tweet_manipulation/ui/add_or_edit_tweet.dart';
import 'package:bettertwitter/screens/user_profile/ui/user_profile_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final arguments = settings.arguments;
  switch (settings.name) {
    case RouteNames.login:
      return MaterialPageRoute(builder: (_) => const AuthenticationView());
    case RouteNames.signup:
      return MaterialPageRoute(builder: (_) => const AuthenticationView());
    case RouteNames.home:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case RouteNames.tweetDetails:
      return MaterialPageRoute(builder: (_) => const TweetDetailView());
    case RouteNames.manipulateTweet:
      return MaterialPageRoute(builder: (_) => const AddOrEditTweetView());
    case RouteNames.userProfile:
      return MaterialPageRoute(builder: (_) => const UserProfileView());
    default: // If there is no such named route in the switch statement, e.g. /third we are directing the user to sign in again
      return MaterialPageRoute(builder: (_) => const StartUpView());
  }
}
