import 'package:bettertwitter/config/constants/app_strings.dart';
import 'package:bettertwitter/models/tweets/tweet_model.dart';
import 'package:bettertwitter/screens/tweet_manipulation/bloc/manipulate_tweet_bloc.dart';
import 'package:bettertwitter/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManipulateTweetView extends StatelessWidget {
  ManipulateTweetView({super.key, this.tweetModel});

  TweetModel? tweetModel;

  TextEditingController tweetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            tweetModel != null ? AppStrings.editTweet : AppStrings.addTweet),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            // initialValue: tweetModel == null ? '' : tweetModel!.tweet,
            controller: tweetController,
            decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                border: InputBorder.none,
                hintText: "Max characters 250",
                hintStyle: TextStyle(color: Colors.grey)),
            style: const TextStyle(
                color: Color(0xff504f4f),
                fontSize: 14,
                fontWeight: FontWeight.w500),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            autocorrect: false,
          ),
          TextButton(
              onPressed: () async {
                context
                    .read<ManipulateTweetBloc>()
                    .add(AddTweetEvent(tweet: tweetController.text));
              },
              child: const Text("Submit Tweet"))
        ],
      ),
      // body: Center(
      //     child: TextButton(
      //         onPressed: () async {
      //           //sign out
      //           // await AuthService(
      //           //   auth: FirebaseAuth.instance,
      //           // ).signOut();

      //         },
      //         child: Text("Sign out"))),
    );
  }
}
