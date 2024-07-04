// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

// class CreateUser extends UserEvent {
//   final String email;
//   final String username;
//   final String uid;
//   final Preferences preferences;
//   const CreateUser({
//     required this.email,
//     required this.username,
//     required this.uid,
//     required this.preferences,
//   });
// }

final class GetUser extends UserEvent {
  final String email;
  final String uid;

  const GetUser({required this.email, required this.uid});
}

final class UpdateWatchHistory extends UserEvent {
  final String email;
  final String uid;
  final WatchHistory watchHistory;
  const UpdateWatchHistory(
      {required this.email, required this.uid, required this.watchHistory});
}

final class UpdateWatchList extends UserEvent {
  final Poster newPoster;
  const UpdateWatchList({required this.newPoster});
}

final class UpdateFavorites extends UserEvent {
  final Poster newPoster;
  const UpdateFavorites({required this.newPoster});
}
