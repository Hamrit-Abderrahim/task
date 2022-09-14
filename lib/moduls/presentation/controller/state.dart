import 'package:equatable/equatable.dart';

class PlayersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppInitialState extends PlayersState {}

class GetPlayersLoadingState extends PlayersState {}

class GetPlayersSuccessState extends PlayersState {}

class GetPlayersErrorState extends PlayersState {
  final String error;
  GetPlayersErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}

//***************add/player **********//
class AddPlayersSuccessState extends PlayersState {}

class RemovePlayersSuccessState extends PlayersState {}

class PlayersSuccessState extends PlayersState {}

//**************v */
class GetMorePlayersLoadingState extends PlayersState {}

class GetMorePlayersSuccessState extends PlayersState {}

class GetMorePlayersErrorState extends PlayersState {
  final String error;
  GetMorePlayersErrorState({required this.error});
  @override
  List<Object?> get props => [error];
}

//***000 */
class LoadingMoreState extends PlayersState {}

class SearcheState extends PlayersState {}

class ChangeIsSearchingSuccessState extends PlayersState {}
