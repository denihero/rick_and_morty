import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable(createToJson: false)
class AllEpisodeModel {
  Info? info;
  List<EpisodeModel>? results;

  AllEpisodeModel({this.info, this.results});

  factory AllEpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$AllEpisodeModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class Info {
  int? count;
  int? pages;
  String? next;
  String? prev;

  Info({this.count, this.pages, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}

@JsonSerializable(createToJson: false)
class EpisodeModel {
  int? id;
  String? name;
  String? airDate;
  String? episode;
  List<String>? characters;
  String? url;
  String? created;

  EpisodeModel(
      {this.id,
      this.name,
      this.airDate,
      this.episode,
      this.characters,
      this.url,
      this.created});

  factory EpisodeModel.fromJson(Map<String, dynamic> json) =>
      _$EpisodeModelFromJson(json);
}
