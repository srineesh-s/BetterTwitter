import 'package:bettertwitter/screens/authentication/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/constants/app_strings.dart';
import '../../../config/routing/route_names.dart';
import '../../../models/tweets/tweet_model.dart';
import '../bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is SignoutSuccess) {
                  Navigator.of(context).pushReplacementNamed(RouteNames.login);
                }
              },
              child: ListTile(
                title: const Text('Sign Out'),
                onTap: () {
                  context.read<AuthenticationBloc>().add(SignoutEvent());
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                AppStrings.yourTweets,
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteNames.manipulateTweet);
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<HomeBloc, TweetStream>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.tweets.length,
            itemBuilder: (context, index) {
              if (state.tweets.isEmpty) {
                return const Center(child: Text("No tweets yet"));
              } else {
                return tweetWidget(state.tweets[index]);
              }
            },
          );
        },
      ),
    );
  }
}

Widget tweetWidget(TweetModel tweetModel) {
  return Container(
    margin: const EdgeInsets.all(10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          imgString(
            tweetModel.user.image,
          ),
          width: 60,
          height: 60,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "@${tweetModel.user.name}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(tweetModel.date),
            const SizedBox(
              height: 5,
            ),
            Text(tweetModel.tweet),
          ],
        ),
        const Spacer(),
        Text(tweetModel.isEdited ? "Edited Tweet" : ""),
      ],
    ),
  );
}

String imgString(String imgId) {
  switch (imgId) {
    case "1":
      return "assets/images/avatar_1.png";
    case "2":
      return "assets/images/avatar_2.png";
    case "3":
      return "assets/images/avatar_3.png";
    default:
      return "assets/images/avatar.png";
  }
}
