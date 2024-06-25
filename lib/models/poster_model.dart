import 'dart:convert';

class Poster {
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

  Poster({
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
  });

  Poster copyWith({
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
  }) =>
      Poster(
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
      );

  factory Poster.fromJson(String str) => Poster.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Poster.fromMap(Map<String, dynamic> json) => Poster(
        id: json["_id"] ?? '',
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
      );

  Map<String, dynamic> toMap() => {
        "id": id,
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
      };
}
