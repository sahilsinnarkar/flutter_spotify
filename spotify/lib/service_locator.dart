import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/repository/song/song_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebasse_service.dart';
import 'package:spotify/data/sources/songs/song_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/auth/song/get_news_songs.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  sl.registerSingleton<SongRepositoryImpl>(
    SongRepositoryImpl(),
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );

  sl.registerSingleton<GetNewsSongsUseCase>(
    GetNewsSongsUseCase(),
  );

//  sl.registerSingleton<GetPlayListUseCase>(
//   GetPlayListUseCase()
//  );

//  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
//   AddOrRemoveFavoriteSongUseCase()
//  );

//  sl.registerSingleton<IsFavoriteSongUseCase>(
//   IsFavoriteSongUseCase()
//  );

//  sl.registerSingleton<GetUserUseCase>(
//   GetUserUseCase()
//  );

//  sl.registerSingleton<GetFavoriteSongsUseCase>(
//   GetFavoriteSongsUseCase()
//  );
}
