import 'package:task/moduls/data/model/user_model.dart';
import 'package:task/moduls/domain/entities/users.dart';

class PlayerModel extends User {
  const PlayerModel({required super.player, required super.total});
  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
      player:
          List<UserModel>.from(json["users"].map((e) => UserModel.fromJson(e))),
      total: json["total"]);
}
