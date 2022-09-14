import 'package:equatable/equatable.dart';

class Player extends Equatable {
  final String firstName;
  final String lastName;
  final String image;
  final int id;
  bool isAdd;

  Player({
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.id,
    this.isAdd = false,
  });

  @override
  List<Object?> get props => [firstName, lastName, image, id, isAdd];
}
