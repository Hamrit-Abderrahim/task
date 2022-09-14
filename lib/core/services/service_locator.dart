import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/moduls/domain/use_case/get_players_usecas.dart';
import 'package:task/moduls/presentation/controller/bloc.dart';

import '../../moduls/data/data_source/remote_data_source.dart';
import '../../moduls/data/repository/repository.dart';
import '../../moduls/domain/respository/base_repository.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() async {
//*****************bloc **************//
    sl.registerFactory(() => PlayersBloc(sl()));
//*****************useCase *****************/
    sl.registerLazySingleton(() => GetPlayersUseCase(sl()));

//*******respositry******* *//
    sl.registerLazySingleton<BaseRepository>(() => Repository(sl()));
//*****************dataSource *********************//
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
    //************sahred pref********** *//
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
  }
}
