import 'package:bettertwitter/config/constants/app_strings.dart';
import 'package:bettertwitter/config/routing/app_router.dart';
import 'package:bettertwitter/config/routing/route_names.dart';
import 'package:bettertwitter/screens/authentication/ui/auth_view.dart';
import 'package:bettertwitter/services/auth_service.dart';
import 'package:bettertwitter/services/firestore_service.dart';
import 'package:bettertwitter/widgets/input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/authentication/bloc/authentication_bloc.dart';
import 'screens/authentication/repository/auth_repository.dart';
import 'screens/home/ui/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(AuthRepository(
              authService: AuthService(
                auth: FirebaseAuth.instance,
              ),
              dbService: DbService(firestore: FirebaseFirestore.instance))),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: generateRoute,
        home: const StartUpView(),
      ),
    );
  }
}

class StartUpView extends StatelessWidget {
  const StartUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeView();
        } else {
          return const AuthenticationView();
        }
      },
    );
  }
}
