import 'package:task/moduls/data/model/players_model.dart';
import 'package:task/moduls/domain/use_case/get_players_usecas.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/remote/dio_helper.dart';
import '../../../core/utils/constatns_manager.dart';

abstract class BaseRemoteDataSource {
  Future<PlayerModel> getPlayers(PlayerParameters parameters);
}

class RemoteDataSource extends BaseRemoteDataSource {
  //***********getPlayers ************//
  @override
  Future<PlayerModel> getPlayers(PlayerParameters parameters) async {
    final response =
        await DioHelper.getData(url: AppConstatns.getUsers(parameters.limit));
    if (response!.statusCode == 200) {
      return PlayerModel.fromJson(response.data);

      // List<PlayerModel>.from(
      //     (response.data["users"] as List).map((e) => PlayerModel.fromJson(e)));
    } else {
      throw ServerException(error: 'not found!');
    }
  }
}
