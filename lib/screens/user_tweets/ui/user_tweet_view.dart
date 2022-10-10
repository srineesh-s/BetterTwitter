import 'package:flutter/material.dart';

import '../../../config/constants/app_strings.dart';

class UserTweetView extends StatelessWidget {
  const UserTweetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        centerTitle: true,
      ),
    );
  }
}
