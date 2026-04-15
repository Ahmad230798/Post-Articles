// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edited_profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditedProfileRequestModel _$EditedProfileRequestModelFromJson(
  Map<String, dynamic> json,
) => EditedProfileRequestModel(
  username: json['username'] as String,
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  bio: json['bio'] as String,
  institution: json['institution'] as String,
  fieldOfStudy: json['field_of_study'] as String,
  academicStatus: json['academic_status'] as String,
  location: json['location'] as String,
  title: json['title'] as String,
  orcidId: json['orcid_id'] as String,
  website: json['website'] as String,
);

Map<String, dynamic> _$EditedProfileRequestModelToJson(
  EditedProfileRequestModel instance,
) => <String, dynamic>{
  'username': instance.username,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'bio': instance.bio,
  'institution': instance.institution,
  'field_of_study': instance.fieldOfStudy,
  'academic_status': instance.academicStatus,
  'location': instance.location,
  'title': instance.title,
  'orcid_id': instance.orcidId,
  'website': instance.website,
};
