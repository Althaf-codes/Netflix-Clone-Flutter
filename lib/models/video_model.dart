import 'dart:convert';

import 'package:netflix_clone/models/poster_model.dart';

class Video {
  String id;
  String title;
  String description;
  List<String> genre;
  String videoType;
  bool hasNewEpisodes;
  bool isTop10;
  int duration;
  int rating;
  int views;
  String thumbnail;
  List<Poster> relatedVideos;
  List<Season> seasons;
  bool isTrailerLaunched;
  bool isPublished;
  String status;
  String releaseDate;
  String url;
  List<String> cast;
  String director;
  String producer;

  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.genre,
    required this.videoType,
    required this.hasNewEpisodes,
    required this.isTop10,
    required this.duration,
    required this.rating,
    required this.views,
    required this.thumbnail,
    required this.relatedVideos,
    required this.seasons,
    required this.isTrailerLaunched,
    required this.isPublished,
    required this.status,
    required this.releaseDate,
    required this.url,
    required this.cast,
    required this.director,
    required this.producer,
  });

  Video copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? genre,
    String? videoType,
    bool? hasNewEpisodes,
    bool? isTop10,
    int? duration,
    int? rating,
    int? views,
    String? thumbnail,
    List<Poster>? relatedVideos,
    List<Season>? seasons,
    bool? isTrailerLaunched,
    bool? isPublished,
    String? status,
    String? releaseDate,
    String? url,
    List<String>? cast,
    String? director,
    String? producer,
  }) =>
      Video(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        genre: genre ?? this.genre,
        videoType: videoType ?? this.videoType,
        hasNewEpisodes: hasNewEpisodes ?? this.hasNewEpisodes,
        isTop10: isTop10 ?? this.isTop10,
        duration: duration ?? this.duration,
        rating: rating ?? this.rating,
        views: views ?? this.views,
        thumbnail: thumbnail ?? this.thumbnail,
        relatedVideos: relatedVideos ?? this.relatedVideos,
        seasons: seasons ?? this.seasons,
        isTrailerLaunched: isTrailerLaunched ?? this.isTrailerLaunched,
        isPublished: isPublished ?? this.isPublished,
        status: status ?? this.status,
        releaseDate: releaseDate ?? this.releaseDate,
        url: url ?? this.url,
        cast: cast ?? this.cast,
        director: director ?? this.director,
        producer: producer ?? this.producer,
      );

  factory Video.fromJson(String str) => Video.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Video.fromMap(Map<String, dynamic> json) => Video(
        id: json['_id'] ?? '',
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        genre: List<String>.from(json["genre"].map((x) => x)),
        videoType: json["videoType"] ?? '',
        hasNewEpisodes: json["hasNewEpisodes"] ?? '',
        isTop10: json["isTop10"] ?? '',
        duration: json["duration"] ?? '',
        rating: json["rating"] ?? '',
        views: json["views"] ?? '',
        thumbnail: json["thumbnail"] ?? '',
        relatedVideos: List<Poster>.from(
            json['relatedVideos'].map((x) => Poster.fromMap(x))),
        seasons:
            List<Season>.from(json["seasons"].map((x) => Season.fromMap(x))),
        isTrailerLaunched: json["isTrailerLaunched"] ?? false,
        isPublished: json["isPublished"] ?? false,
        status: json["status"] ?? '',
        releaseDate: json["releaseDate"] ?? '',
        url: json["url"] ?? '',
        cast: List<String>.from(json["cast"].map((x) => x)),
        director: json["director"] ?? '',
        producer: json["producer"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "description": description,
        "genre": List<dynamic>.from(genre.map((x) => x)),
        "videoType": videoType,
        "hasNewEpisodes": hasNewEpisodes,
        "isTop10": isTop10,
        "duration": duration,
        "rating": rating,
        "views": views,
        "thumbnail": thumbnail,
        "relatedVideos":
            List<dynamic>.from(relatedVideos.map((x) => x.toMap())),
        "seasons": List<dynamic>.from(seasons.map((x) => x.toMap())),
        "isTrailerLaunched": isTrailerLaunched,
        "isPublished": isPublished,
        "status": status,
        "releaseDate": releaseDate,
        "url": url,
        "cast": List<dynamic>.from(cast.map((x) => x)),
        "director": director,
        "producer": producer,
      };
}

class Season {
  int season;
  String trailerUrl;
  List<Poster> episodes;

  Season({
    required this.season,
    required this.trailerUrl,
    required this.episodes,
  });

  Season copyWith({
    int? season,
    String? trailerUrl,
    List<Poster>? episodes,
  }) =>
      Season(
        season: season ?? this.season,
        trailerUrl: trailerUrl ?? this.trailerUrl,
        episodes: episodes ?? this.episodes,
      );

  factory Season.fromJson(String str) => Season.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Season.fromMap(Map<String, dynamic> json) => Season(
        season: json["season"] ?? '',
        trailerUrl: json["trailerUrl"] ?? '',
        episodes:
            List<Poster>.from(json['episodes'].map((x) => Poster.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "season": season,
        "trailerUrl": trailerUrl,
        "episodes": List<dynamic>.from(episodes.map((x) => x.toMap())),
      };
}


// class RelatedVideo {
//   String id;
//   String title;
//   String description;
//   List<String> genre;
//   String videoType;
//   bool hasNewEpisodes;
//   bool isTop10;
//   int duration;
//   int rating;
//   int views;
//   String thumbnail;

//   RelatedVideo({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.genre,
//     required this.videoType,
//     required this.hasNewEpisodes,
//     required this.isTop10,
//     required this.duration,
//     required this.rating,
//     required this.views,
//     required this.thumbnail,
//   });

//   RelatedVideo copyWith({
//     String? id,
//     String? title,
//     String? description,
//     List<String>? genre,
//     String? videoType,
//     bool? hasNewEpisodes,
//     bool? isTop10,
//     int? duration,
//     int? rating,
//     int? views,
//     String? thumbnail,
//   }) =>
//       RelatedVideo(
//         id: id ?? this.id,
//         title: title ?? this.title,
//         description: description ?? this.description,
//         genre: genre ?? this.genre,
//         videoType: videoType ?? this.videoType,
//         hasNewEpisodes: hasNewEpisodes ?? this.hasNewEpisodes,
//         isTop10: isTop10 ?? this.isTop10,
//         duration: duration ?? this.duration,
//         rating: rating ?? this.rating,
//         views: views ?? this.views,
//         thumbnail: thumbnail ?? this.thumbnail,
//       );

//   factory RelatedVideo.fromJson(String str) =>
//       RelatedVideo.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory RelatedVideo.fromMap(Map<String, dynamic> json) => RelatedVideo(
//         id: json["id"],
//         title: json["title"],
//         description: json["description"],
//         genre: List<String>.from(json["genre"].map((x) => x)),
//         videoType: json["videoType"],
//         hasNewEpisodes: json["hasNewEpisodes"],
//         isTop10: json["isTop10"],
//         duration: json["duration"],
//         rating: json["rating"],
//         views: json["views"],
//         thumbnail: json["thumbnail"],
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "title": title,
//         "description": description,
//         "genre": List<dynamic>.from(genre.map((x) => x)),
//         "videoType": videoType,
//         "hasNewEpisodes": hasNewEpisodes,
//         "isTop10": isTop10,
//         "duration": duration,
//         "rating": rating,
//         "views": views,
//         "thumbnail": thumbnail,
//       };
// }


