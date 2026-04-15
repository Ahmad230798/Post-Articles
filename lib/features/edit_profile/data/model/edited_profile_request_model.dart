import 'package:json_annotation/json_annotation.dart';

part 'edited_profile_request_model.g.dart';

@JsonSerializable()
class EditedProfileRequestModel {
  final String username;
  final String email;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  final String bio;
  final String institution;

  @JsonKey(name: 'field_of_study')
  final String fieldOfStudy;

  @JsonKey(name: 'academic_status')
  final String academicStatus;

  final String location;
  final String title;

  @JsonKey(name: 'orcid_id')
  final String orcidId;

  final String website;

  const EditedProfileRequestModel({
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.institution,
    required this.fieldOfStudy,
    required this.academicStatus,
    required this.location,
    required this.title,
    required this.orcidId,
    required this.website,
  });

  factory EditedProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EditedProfileRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditedProfileRequestModelToJson(this);
}
