import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final String message;
  final User user;

  RegisterResponse({required this.message, required this.user});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class User {
  final int id;
  final String username;
  final String email;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;

  final String? avatar;
  final String bio;

  final String institution;
  @JsonKey(name: "field_of_study")
  final String fieldOfStudy;
  @JsonKey(name: "academic_status")
  final String academicStatus;

  final String location;
  final String title;
  @JsonKey(name: "orcid_id")
  final String orcidId;
  final String website;

  final List<dynamic> expertise;
  @JsonKey(name: "posts_count")
  final int postsCount;
  @JsonKey(name: "network_count")
  final int networkCount;
  @JsonKey(name: "date_joined")
  final String dateJoined;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.avatar,
    required this.bio,
    required this.institution,
    required this.fieldOfStudy,
    required this.academicStatus,
    required this.location,
    required this.title,
    required this.orcidId,
    required this.website,
    required this.expertise,
    required this.postsCount,
    required this.networkCount,
    required this.dateJoined,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
