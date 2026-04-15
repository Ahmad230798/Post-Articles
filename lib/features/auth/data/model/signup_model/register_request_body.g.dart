// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
RegisterRequestBody _$RegisterRequestBodyFromJson(Map<String, dynamic> json) =>
    RegisterRequestBody(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      password2: json['password2'] as String,
      fieldOfStudy: json['field_of_study'] as String,
      academicStatus: json['academic_status'] as String,
      institution: json['institution'] as String,
      firstName: json['first_name'] as String,
      lastNmae: json['last_name'] as String,
    );

Map<String, dynamic> _$RegisterRequestBodyToJson(
  RegisterRequestBody instance,
) => <String, dynamic>{
  'username': instance.username,
  'email': instance.email,
  'password': instance.password,
  'password2': instance.password2,
  'field_of_study': instance.fieldOfStudy,
  'academic_status': instance.academicStatus,
  'first_name': instance.firstName,
  'last_name': instance.lastNmae,
  'institution': instance.institution,
};
