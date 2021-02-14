import 'dart:core';

import 'package:crm/models/student.dart';
import 'package:json_annotation/json_annotation.dart';

part 'studentResponse.g.dart';

@JsonSerializable()
class StudentResponse
{
  List<Student> students;

  StudentResponse(this.students);

  static StudentResponse fromJson(Map<String, dynamic> input)
  {
    var result = _$StudentResponseFromJson(input);
    return result;
  }


}