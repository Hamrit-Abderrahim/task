import 'package:task/moduls/domain/entities/player.dart';

class UserModel extends Player {
  UserModel(
      {required super.firstName,
      required super.lastName,
      required super.image,
      required super.id});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        image: json["image"],
        id: json["id"],
      );
}
