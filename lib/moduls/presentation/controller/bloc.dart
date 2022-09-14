import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/network/local/cache_helper.dart';
import 'package:task/moduls/domain/entities/player.dart';
import 'package:task/moduls/presentation/controller/state.dart';

import '../../domain/use_case/get_players_usecas.dart';

class PlayersBloc extends Cubit<PlayersState> {
  final GetPlayersUseCase getPlayersUseCase;

  PlayersBloc(this.getPlayersUseCase) : super(AppInitialState());
  static PlayersBloc get(context) => BlocProvider.of(context);

//************************ _getDetailsTV ****************//
  List<Player> users = [];
  int currentLimit = 10;
  int total = 0;
  Future getUsers() async {
    emit(GetPlayersLoadingState());

    final result = await getPlayersUseCase(PlayerParameters(
      limit: currentLimit,
    ));
    result.fold((l) => emit(GetPlayersErrorState(error: l.messgae)), (r) {
      users = r.player;
      total = r.total;

      emit(GetPlayersSuccessState());
    });
  }

  addPlayer(index) {
    users[index].isAdd = true;

    em();
    emit(AddPlayersSuccessState());
  }

  removePlayer(index) {
    users[index].isAdd = false;
    CacheHelper.saveData(key: "users[index].isAdd", value: false);
    em();
    emit(RemovePlayersSuccessState());
  }

  em() {
    emit(PlayersSuccessState());
  }

  //**********ScrollController */
  int limit = 0;
  bool isLoadingMore = false;
  bool noMoreData = false;
  controller(ScrollController controller) {
    controller.addListener(() async {
      if (isLoadingMore) return;
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        isLoadingMore = true;
        emit(LoadingMoreState());
        if (currentLimit < total) currentLimit = currentLimit + 10;
        await loadMore();
        isLoadingMore = false;
        if (currentLimit == total) noMoreData = true;
        emit(LoadingMoreState());
      }
    });
  }
  //*******lod more */

  Future<void> loadMore() async {
    emit(GetMorePlayersLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    final result = await getPlayersUseCase(PlayerParameters(
      limit: currentLimit,
    ));
    result.fold((l) => emit(GetMorePlayersErrorState(error: l.messgae)), (r) {
      users = r.player;
      total = total;

      emit(GetMorePlayersSuccessState());
    });
  }

  //******search *********/
  List<Player> searchList = [];
  bool isSearching = false;
  void search(String value) {
    value = value.toLowerCase();
    searchList = users.where((u) {
      String nameUser = u.firstName.toLowerCase();
      return nameUser.contains(value);
    }).toList();

    emit(SearcheState());
  }

  void searchingTrue() {
    isSearching = true;
    emit(ChangeIsSearchingSuccessState());
  }

  void searchingfalse() {
    isSearching = false;
    emit(ChangeIsSearchingSuccessState());
  }
}
