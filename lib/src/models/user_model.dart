import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  @JsonKey(name: 'fullname')
  String? name;
  String? email;
  String? phone;
  @JsonKey(name: 'cpf')
  String? document;
  String? password;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.document,
    this.password,
    this.token,
  });

  // factory UserModel.fromMap(Map<String, dynamic> json) {
  //   return UserModel(
  //     id: json['id'],
  //     name: json['fullname'],
  //     email: json['email'],
  //     phone: json['phone'],
  //     document: json['cpf'],
  //     //password: json['password'],
  //     token: json['token'],
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //     'document': document,
  //     'password': password,
  //     'token': token,
  //   };
  // }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // run build_runner to generate user_model.g.dart
  // dart run build_runner build

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, phone: $phone, document: $document, token: $token)';
  }
}
