import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rich_and_morti_test_task/app/network/dio_settings.dart';
import 'package:rich_and_morti_test_task/feature/characters/data/data_source/character_data_source.dart';
import 'package:rich_and_morti_test_task/feature/characters/data/repository/character_repository_impl.dart';
import 'package:rich_and_morti_test_task/feature/characters/data/source/remote/character_api_remote_source.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/repository/character_repository.dart';
import 'package:rich_and_morti_test_task/feature/characters/presentation/bloc/character_bloc.dart';
import 'package:rich_and_morti_test_task/feature/episode/data/data_source/episode_data_source.dart';
import 'package:rich_and_morti_test_task/feature/episode/data/repository/episode_repository_impl.dart';
import 'package:rich_and_morti_test_task/feature/episode/data/source/remote/episode_api_remote_source.dart';
import 'package:rich_and_morti_test_task/feature/episode/domain/repository/episode_repository.dart';
import 'package:rich_and_morti_test_task/feature/episode/presentation/bloc/episode_bloc.dart';

GetIt diInstance = GetIt.instance;

initServiceLocator() async {
  registerDio();
  registerDataSource();
  registerApiDataSource();
  registerRepository();
  registerBloc();
}

registerDio() {
  diInstance.registerLazySingleton(
    () => Dio(
      BaseOptions(baseUrl: 'https://rickandmortyapi.com'),
    ),
  );

  diInstance.registerLazySingleton(() => DioSetting(diInstance<Dio>()));
}

registerDataSource() {
  diInstance.registerLazySingleton(
      () => CharacterDataSource(client: diInstance<DioSetting>()));
  diInstance.registerLazySingleton(
          () => EpisodeDataSource(client: diInstance<DioSetting>()));
}

registerApiDataSource() {
  diInstance.registerLazySingleton(
      () => CharacterApiRemoteSource(diInstance<CharacterDataSource>()));
  diInstance.registerLazySingleton(
          () => EpisodeApiRemoteSource(diInstance<EpisodeDataSource>()));
}

registerRepository() {
  diInstance.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(diInstance<CharacterApiRemoteSource>()));

  diInstance.registerLazySingleton<EpisodeRepository>(
          () => EpisodeRepositoryImpl(diInstance<EpisodeApiRemoteSource>()));
}

registerBloc() {
  diInstance.registerFactory(
    () => CharacterBloc(diInstance<CharacterRepository>()),
  );

  diInstance.registerFactory(
        () => EpisodeBloc(diInstance<EpisodeRepository>()),
  );
}
