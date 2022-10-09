import 'package:bettertwitter/config/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/constants/app_strings.dart';
import '../../../widgets/input_field.dart';
import '../bloc/authentication_bloc.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({super.key});

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode nameFocusNode = FocusNode();

  bool isSignup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            TextButton(
                key: Key("switchAuth"),
                onPressed: () {
                  setState(() {
                    isSignup = !isSignup;
                  });
                },
                child: Text(
                  isSignup ? AppStrings.login : AppStrings.signup,
                ))
          ],
        ),
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationSuccess) {
              Navigator.of(context).pushReplacementNamed(RouteNames.home);
            } else if (state is AuthenticationFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isSignup
                          ? AppStrings.signUptoTwitter
                          : AppStrings.loginToTwitter,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InputField(
                      placeholder: 'Email',
                      password: false,
                      controller: emailController,
                      noFunctionTap: true,
                      nextFocusNode: passwordFocusNode,
                    ),
                    InputField(
                        fieldFocusNode: passwordFocusNode,
                        placeholder: 'Password',
                        password: true,
                        controller: passwordController,
                        nextFocusNode: isSignup ? nameFocusNode : null,
                        noFunctionTap: false),
                    isSignup
                        ? InputField(
                            fieldFocusNode: passwordFocusNode,
                            placeholder: 'Choose a User Name',
                            controller: nameController,
                            textInputType: TextInputType.name,
                            noFunctionTap: false)
                        : Container(),
                    TextButton(
                      key: Key("Authbutton"),
                      onPressed: () async {
                        if (isSignup) {
                          //add bloc event
                          context.read<AuthenticationBloc>().add(
                                SignupEvent(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    image: 1.toString()),
                              );
                        } else {
                          context.read<AuthenticationBloc>().add(LoginEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ));
                        }
                      },
                      child: (state is AuthenticationLoading)
                          ? CircularProgressIndicator()
                          : Text(
                              isSignup ? AppStrings.signup : AppStrings.login),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
