import 'package:task/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../domain/respository/base_repository.dart';
import '../../domain/use_case/get_players_usecas.dart';
import '../data_source/remote_data_source.dart';
import '../model/players_model.dart';

class Repository extends BaseRepository {
  final BaseRemoteDataSource baseRemoteDataSource;

  Repository(this.baseRemoteDataSource);

  //************** getPlayers  ***********//

  @override
  Future<Either<Failure, PlayerModel>> getPlayers(
      PlayerParameters parameters) async {
    final result = await baseRemoteDataSource.getPlayers(parameters);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
