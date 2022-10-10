import 'package:bettertwitter/config/constants/app_strings.dart';
import 'package:bettertwitter/config/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        centerTitle: true,
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
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.users[index].name),
                subtitle: Text(state.users[index].email),
              );
            },
          );
        },
      ),
    );
  }
}
