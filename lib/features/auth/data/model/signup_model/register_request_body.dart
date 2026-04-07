import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String username;
  final String email;
  final String password;
  final String password2;
  @JsonKey(name: "field_of_study")
  final String fieldOfStudy;
  @JsonKey(name: "academic_status")
  final String academicStatus;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastNmae;
  final String institution;

  RegisterRequestBody({
    required this.username,
    required this.email,
    required this.password,
    required this.password2,
    required this.fieldOfStudy,
    required this.academicStatus,
    required this.institution, required this.firstName, required this.lastNmae,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
