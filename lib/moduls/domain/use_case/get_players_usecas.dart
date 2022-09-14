import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task/moduls/domain/entities/users.dart';
import 'package:task/moduls/domain/respository/base_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';

class GetPlayersUseCase extends BaseUseCases<User, PlayerParameters> {
  final BaseRepository baseRepository;

  GetPlayersUseCase(this.baseRepository);

  @override
  Future<Either<Failure, User>> call(PlayerParameters parameters) async {
    return await baseRepository.getPlayers(parameters);
  }
}

class PlayerParameters extends Equatable {
  final int limit;
  //final int page;

  const PlayerParameters({
    required this.limit,
    // required this.page,
  });

  @override
  List<Object?> get props => [limit];
}
