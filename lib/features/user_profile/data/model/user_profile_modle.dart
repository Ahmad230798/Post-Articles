import 'package:json_annotation/json_annotation.dart';
part 'user_profile_modle.g.dart';
@JsonSerializable()
class UserProfileModle {
  final String message;

  UserProfileModle({required this.message});
  factory UserProfileModle.fromjson(Map<String, dynamic> json) =>
      _$UserProfileModleFromJson(json);
}
