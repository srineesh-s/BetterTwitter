import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../services/auth_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthService(
            auth: FirebaseAuth.instance,
          ).signOut();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: TextButton(
            onPressed: () async {
              await AuthService(
                auth: FirebaseAuth.instance,
              ).signOut();
            },
            child: Text('Home')),
      ),
    );
  }
}
