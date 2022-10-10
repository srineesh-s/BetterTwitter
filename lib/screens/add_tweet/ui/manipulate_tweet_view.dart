import 'package:bettertwitter/config/constants/app_strings.dart';
import 'package:bettertwitter/screens/add_tweet/bloc/add_tweet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTweetView extends StatelessWidget {
  AddTweetView({super.key});

  TextEditingController tweetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addTweet),
      ),
      body: BlocConsumer<AddTweetBloc, AddTweetState>(
        listener: (context, state) {
          if (state is ManipulateTweetSuccess) {
            tweetController.clear();
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: tweetController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(280),
                ],
                autofocus: true,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 10),
                    border: InputBorder.none,
                    hintText: "Max characters 280",
                    hintStyle: TextStyle(color: Colors.grey)),
                style: const TextStyle(
                    color: Color(0xff504f4f),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                autocorrect: false,
              ),
              (state is ManipulateTweetLoading)
                  ? const CircularProgressIndicator()
                  : TextButton(
                      onPressed: () async {
                        context
                            .read<AddTweetBloc>()
                            .add(AddTweetEvent(tweet: tweetController.text));
                      },
                      child: const Text("Submit Tweet"))
            ],
          );
        },
      ),
    );
  }
}
