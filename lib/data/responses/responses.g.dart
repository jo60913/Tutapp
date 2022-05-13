// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse()
    ..status = json['status'] as int?
    ..message = json['message'] as String?;
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) {
  return CustomerResponse(
    json['id'] as String?,
    json['name'] as String?,
    json['numOfNotifitcation'] as int?,
  );
}

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numOfNotifitcation': instance.numOfNotifitcation,
    };

ConstactsResponse _$ConstactsResponseFromJson(Map<String, dynamic> json) {
  return ConstactsResponse(
    json['email'] as String?,
    json['phone'] as String?,
    json['link'] as String?,
  );
}

Map<String, dynamic> _$ConstactsResponseToJson(ConstactsResponse instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'link': instance.link,
      'email': instance.email,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
    Map<String, dynamic> json) {
  return AuthenticationResponse(
    json['customer'] == null
        ? null
        : CustomerResponse.fromJson(json['customer'] as Map<String, dynamic>),
    json['contracts'] == null
        ? null
        : ConstactsResponse.fromJson(json['contracts'] as Map<String, dynamic>),
  )
    ..status = json['status'] as int?
    ..message = json['message'] as String?;
}

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer': instance.customer,
      'contracts': instance.constacts,
    };
