// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return Payment(
    json['timeStamp'] == null
        ? null
        : DateTime.parse(json['timeStamp'] as String),
    (json['amount'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'timeStamp': instance.timeStamp?.toIso8601String(),
      'amount': instance.amount,
    };
