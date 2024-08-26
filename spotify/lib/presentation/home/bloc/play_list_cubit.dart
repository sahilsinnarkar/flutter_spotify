import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spotify/domain/usecases/song/get_play_list.dart';
import 'package:spotify/presentation/home/bloc/play_list_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {

  PlaylistCubit() : super(PlaylistLoading());

  final GetIt sl = GetIt.instance;

  Future < void > getPlaylist() async {
    var returnedSongs = await sl < GetPlaylistUseCase > ().call();
    returnedSongs.fold(
      (l) {
        emit(PlaylistLoadFailure());
      },
      (data) {
        emit(
          PlaylistLoaded(songs: data)
        );
      }
    );
  }
  
  
}