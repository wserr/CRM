import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student
{
  int id;
  String name;
  String firstName;

  Student(this.id, this.name, this.firstName);  

  static Student fromJson(Map<String,dynamic> input)
  {
    var result = _$StudentFromJson(input);
    return result;
  }

  String toJson()
  {
    var result = _$StudentToJson(this);
    var json = jsonEncode(result);
    return json;
  }
}