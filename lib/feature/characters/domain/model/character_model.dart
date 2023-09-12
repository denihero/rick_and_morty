import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable(createToJson: false)
class AllCharacterModel {
  Info? info;
  List<Character>? results;

  AllCharacterModel({this.info, this.results});

  factory AllCharacterModel.fromJson(Map<String,dynamic> json) => _$AllCharacterModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class Info {
  int? count;
  int? pages;
  String? next;
  String? prev;

  Info({this.count, this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String,dynamic> json) => _$InfoFromJson(json);

}

@JsonSerializable(createToJson: false)
class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Origin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Character(
      {this.id,
        this.name,
        this.status,
        this.species,
        this.type,
        this.gender,
        this.origin,
        this.location,
        this.image,
        this.episode,
        this.url,
        this.created});

  factory Character.fromJson(Map<String,dynamic> json) => _$CharacterFromJson(json);


}

@JsonSerializable(createToJson: false)
class Origin {
  String? name;
  String? url;

  Origin({this.name, this.url});

  factory Origin.fromJson(Map<String,dynamic> json) => _$OriginFromJson(json);
}
