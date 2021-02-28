// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentDetail _$StudentDetailFromJson(Map<String, dynamic> json) {
  return StudentDetail(
    json['name'] as String,
    json['firstName'] as String,
    json['email'] as String,
    (json['payments'] as List)
        ?.map((e) =>
            e == null ? null : Payment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StudentDetailToJson(StudentDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'firstName': instance.firstName,
      'email': instance.email,
      'payments': instance.payments,
    };
