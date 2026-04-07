// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      message: json['message'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{'message': instance.message, 'user': instance.user};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  avatar: json['avatar'] as String?,
  bio: json['bio'] as String,
  institution: json['institution'] as String,
  fieldOfStudy: json['field_of_study'] as String,
  academicStatus: json['academic_status'] as String,
  location: json['location'] as String,
  title: json['title'] as String,
  orcidId: json['orcid_id'] as String,
  website: json['website'] as String,
  expertise: json['expertise'] as List<dynamic>,
  postsCount: (json['posts_count'] as num).toInt(),
  networkCount: (json['network_count'] as num).toInt(),
  dateJoined: json['date_joined'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'avatar': instance.avatar,
  'bio': instance.bio,
  'institution': instance.institution,
  'field_of_study': instance.fieldOfStudy,
  'academic_status': instance.academicStatus,
  'location': instance.location,
  'title': instance.title,
  'orcid_id': instance.orcidId,
  'website': instance.website,
  'expertise': instance.expertise,
  'posts_count': instance.postsCount,
  'network_count': instance.networkCount,
  'date_joined': instance.dateJoined,
};
