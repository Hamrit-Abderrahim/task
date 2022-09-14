import 'package:equatable/equatable.dart';
import 'package:task/moduls/domain/entities/player.dart';

class User extends Equatable {
  final List<Player> player;
  final int total;

  const User({required this.player, required this.total});
  @override
  List<Object?> get props => [player, total];
}
