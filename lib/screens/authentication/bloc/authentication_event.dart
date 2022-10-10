part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

class SignupEvent extends AuthenticationEvent {
  final String name;
  final String email;
  final String password;
  final String image;

  SignupEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.image});
}

class SignoutEvent extends AuthenticationEvent {}
