// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      name: json['fullname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      document: json['cpf'] as String?,
      password: json['password'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'fullname': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'cpf': instance.document,
      'password': instance.password,
      'token': instance.token,
    };
