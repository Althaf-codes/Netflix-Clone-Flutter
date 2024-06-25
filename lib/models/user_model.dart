import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:netflix_clone/models/poster_model.dart';

class UserModel extends Equatable {
  final String username;
  final String email;
  final String uid;
  final Subscription subscription;
  final List<WatchHistory> watchHistory;
  final List<Poster> favorites;
  final List<Poster> watchlist;
  final Preferences preferences;

  const UserModel({
    required this.username,
    required this.email,
    required this.uid,
    required this.subscription,
    required this.watchHistory,
    required this.favorites,
    required this.watchlist,
    required this.preferences,
  });

  static const empty = UserModel(
      username: '',
      email: '',
      uid: '',
      subscription: Subscription(plan: '', startDate: '', endDate: ''),
      watchHistory: [],
      favorites: [],
      watchlist: [],
      preferences: Preferences(genres: [], languages: []));

  UserModel copyWith({
    String? username,
    String? email,
    String? uid,
    Subscription? subscription,
    List<WatchHistory>? watchHistory,
    List<Poster>? favorites,
    List<Poster>? watchlist,
    Preferences? preferences,
  }) =>
      UserModel(
        username: username ?? this.username,
        email: email ?? this.email,
        uid: uid ?? this.uid,
        subscription: subscription ?? this.subscription,
        watchHistory: watchHistory ?? this.watchHistory,
        favorites: favorites ?? this.favorites,
        watchlist: watchlist ?? this.watchlist,
        preferences: preferences ?? this.preferences,
      );

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        uid: json["uid"] ?? '',
        subscription: Subscription.fromMap(json["subscription"]),
        watchHistory: List<WatchHistory>.from(
            json["watchHistory"].map((x) => WatchHistory.fromMap(x))),
        favorites:
            List<Poster>.from(json["favorites"].map((x) => Poster.fromMap(x))),
        watchlist:
            List<Poster>.from(json["watchlist"].map((x) => Poster.fromMap(x))),
        preferences: Preferences.fromMap(json["preferences"]),
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "email": email,
        "uid": uid,
        "subscription": subscription.toMap(),
        "watchHistory": List<dynamic>.from(watchHistory.map((x) => x.toMap())),
        "favorites": List<dynamic>.from(favorites.map((x) => x)),
        "watchlist": watchHistory,
        "preferences": preferences.toMap(),
      };

  @override
  List<Object?> get props =>
      [username, email, uid, subscription, favorites, watchlist, preferences];
}

class Preferences {
  final List<String> genres;
  final List<String> languages;

  const Preferences({
    required this.genres,
    required this.languages,
  });

  Preferences copyWith({
    List<String>? genres,
    List<String>? languages,
  }) =>
      Preferences(
        genres: genres ?? this.genres,
        languages: languages ?? this.languages,
      );

  factory Preferences.fromJson(String str) =>
      Preferences.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Preferences.fromMap(Map<String, dynamic> json) => Preferences(
        genres: List<String>.from(json["genres"].map((x) => x)),
        languages: List<String>.from(json["languages"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "languages": List<dynamic>.from(languages.map((x) => x)),
      };
}

class Subscription {
  final String plan;
  final String startDate;
  final String endDate;

  const Subscription({
    required this.plan,
    required this.startDate,
    required this.endDate,
  });

  Subscription copyWith({
    String? plan,
    String? startDate,
    String? endDate,
  }) =>
      Subscription(
        plan: plan ?? this.plan,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );

  factory Subscription.fromJson(String str) =>
      Subscription.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subscription.fromMap(Map<String, dynamic> json) => Subscription(
        plan: json["plan"] ?? '',
        startDate: json["startDate"] ?? '',
        endDate: json["endDate"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "plan": plan,
        "startDate": startDate,
        "endDate": endDate,
      };
}

class WatchHistory {
  // String videoId;
  Poster poster;
  String watchedAt;
  int progress;

  WatchHistory({
    // required this.videoId,
    required this.poster,
    required this.watchedAt,
    required this.progress,
  });

  WatchHistory copyWith({
    // String? videoId,
    Poster? poster,
    String? watchedAt,
    int? progress,
  }) =>
      WatchHistory(
        // videoId: videoId ?? this.videoId,
        poster: poster ?? this.poster,
        watchedAt: watchedAt ?? this.watchedAt,
        progress: progress ?? this.progress,
      );

  factory WatchHistory.fromJson(String str) =>
      WatchHistory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WatchHistory.fromMap(Map<String, dynamic> json) => WatchHistory(
        // videoId: json["videoId"] ?? '',
        poster: Poster.fromJson(json['poster']),
        watchedAt: json["watchedAt"] ?? '',
        progress: json["progress"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        // "videoId": videoId,
        "poster": poster.toMap(),
        "watchedAt": watchedAt,
        "progress": progress,
      };
}
