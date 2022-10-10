import 'package:bettertwitter/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tweet_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TweetModel {
  String id;
  String userId;
  String tweet;
  List<String>? relatedtweets;
  bool isEdited;
  String date;
  UserModel user;

  TweetModel({
    required this.id,
    required this.userId,
    required this.tweet,
    this.relatedtweets,
    required this.user,
    this.isEdited = false,
    required this.date,
  });

  factory TweetModel.fromJson(Map<String, dynamic> json) =>
      _$TweetModelFromJson(json);
  Map<String, dynamic> toJson() => _$TweetModelToJson(this);
}
