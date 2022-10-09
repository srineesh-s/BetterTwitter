import 'package:json_annotation/json_annotation.dart';
part 'tweet_model.g.dart';

@JsonSerializable()
class TweetModel {
  String id;
  String userId;
  String text;
  String date;

  TweetModel({
    required this.id,
    required this.userId,
    required this.text,
    required this.date,
  });

  factory TweetModel.fromJson(Map<String, dynamic> json) =>
      _$TweetModelFromJson(json);
  Map<String, dynamic> toJson() => _$TweetModelToJson(this);
}
