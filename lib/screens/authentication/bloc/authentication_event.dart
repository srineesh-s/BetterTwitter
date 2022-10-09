part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});
}

class SignupEvent extends AuthenticationEvent {
  final String name;
  final String email;
  final String password;
  final String image;

  const SignupEvent(
      {required this.name,
      required this.email,
      required this.password,
      required this.image});
}
