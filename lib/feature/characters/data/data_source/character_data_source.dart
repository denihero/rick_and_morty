import 'package:dio/dio.dart';
import 'package:rich_and_morti_test_task/app/network/dio_settings.dart';

class CharacterDataSource{
  CharacterDataSource({required this.client});

  final DioSetting client;

  Future<Response> getAllCharacters(int page){
    return client.dio.get('/api/character?page=$page');
  }
}