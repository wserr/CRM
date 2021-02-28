
import 'package:json_annotation/json_annotation.dart';


part 'payment.g.dart';

@JsonSerializable()
class Payment
{
  DateTime timeStamp;
  double amount;

  Payment(this.timeStamp, this.amount);

  static Payment fromJson(Map<String,dynamic> input)
  {
    var result = _$PaymentFromJson(input);
    return result;
  }

}