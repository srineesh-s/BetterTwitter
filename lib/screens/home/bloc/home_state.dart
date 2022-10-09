// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class TweetStream {
  List<UserModel> users;
  TweetStream({
    required this.users,
  });
}

class TweetLoading extends HomeState {}

class TweetError extends HomeState {}
