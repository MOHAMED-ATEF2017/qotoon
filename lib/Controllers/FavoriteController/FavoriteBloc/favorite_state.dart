class FavoriteState {}

final class FavoriteStateStart extends FavoriteState {}

final class FavoriteStateSuccess extends FavoriteState {
  final List<dynamic> data;

  FavoriteStateSuccess({required this.data});
}

final class FavoriteStateFailed extends FavoriteState {}
