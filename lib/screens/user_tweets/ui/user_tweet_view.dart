import 'package:bettertwitter/screens/user_tweets/bloc/user_tweet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/constants/app_strings.dart';

class UserTweetView extends StatefulWidget {
  @override
  State<UserTweetView> createState() => _UserTweetViewState();
}

class _UserTweetViewState extends State<UserTweetView> {
  @override
  void initState() {
    context.read<UserTweetBloc>().add(GetUserTweetsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.yourTweets),
        centerTitle: true,
      ),
      body: BlocConsumer<UserTweetBloc, UserTweetState>(
        listener: (context, state) {
          if (state is UserTweetFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
          if (state is DeleteTweetSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Tweet Deleted'),
              ),
            );
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          if (state is UserTweetLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserTweetSuccess) {
            return (state.tweets.isEmpty)
                ? const Center(
                    child: Text("No tweets available start tweeting"),
                  )
                : ListView.builder(
                    itemCount: state.tweets.length,
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                        color: Colors.grey[300],
                        child: ListTile(
                          title: Text(state.tweets[index].tweet),
                          subtitle:
                              Text(state.tweets[index].date.substring(0, 10)),
                          trailing: IconButton(
                            onPressed: () {
                              context.read<UserTweetBloc>().add(
                                    DeleteUserTweetEvent(
                                      tweetModel: state.tweets[index],
                                    ),
                                  );
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ),
                      );
                    });
          } else {
            return const Center(
              child: Text('No Tweets'),
            );
          }
        },
      ),
    );
  }
}
