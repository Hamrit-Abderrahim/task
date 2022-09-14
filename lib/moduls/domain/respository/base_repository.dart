import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/users.dart';
import '../use_case/get_players_usecas.dart';

abstract class BaseRepository {
  Future<Either<Failure, User>> getPlayers(PlayerParameters parameters);
}
