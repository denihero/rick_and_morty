import 'package:dio/dio.dart';
import 'package:rich_and_morti_test_task/app/network/dio_settings.dart';

class CharacterDataSource {
  CharacterDataSource({required this.client});

  final DioSetting client;

  Future<Response> getAllCharacters(int page) {
    return client.dio.get('/api/character?page=$page');
  }

  Future<Response> filterAllCharacters({String? name, String? status,
      String? species, String? type, String? gender,required int page, }) {
    return client.dio.get('/api/character?page=$page'
        '${name?.isNotEmpty ?? false ? '&name=$name' : ''}'
        '${status?.isNotEmpty ?? false ? '&status=$status' : ''}'
        '${species?.isNotEmpty ?? false ? '&species=$species' : ''}'
        '${type?.isNotEmpty ?? false ? '&type=$type' : ''}'
        '${gender?.isNotEmpty ?? false ? '&gender=$gender' : ''}');
  }
}
