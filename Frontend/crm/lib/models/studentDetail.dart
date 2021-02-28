import 'package:crm/models/payment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'studentDetail.g.dart';

@JsonSerializable()
class StudentDetail
{
  String name;
  String firstName;
  String email;

  List<Payment> payments;

  StudentDetail(this.name, this.firstName, this.email, this.payments);

  static StudentDetail fromJson(Map<String,dynamic> input)
  {
    var result = _$StudentDetailFromJson(input);
    return result;
  }




}