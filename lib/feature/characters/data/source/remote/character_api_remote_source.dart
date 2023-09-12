import 'package:rich_and_morti_test_task/app/network/network_error.dart';
import 'package:rich_and_morti_test_task/feature/characters/data/data_source/character_data_source.dart';
import 'package:rich_and_morti_test_task/feature/characters/domain/model/character_model.dart';

class CharacterApiRemoteSource{
  CharacterApiRemoteSource(this.characterDataSource);
  final CharacterDataSource characterDataSource;

  Future<AllCharacterModel> getAllCharacter(int page) async{
    final response = await characterDataSource.getAllCharacters(page);

    if(response.statusCode == 200){
      return AllCharacterModel.fromJson(response.data);
      }else if(response.statusCode! >= 400){
        throw Exception(response.statusCode);
      }else {
        throw ResponseError(message: 'Ошибка');
      }
  }

}