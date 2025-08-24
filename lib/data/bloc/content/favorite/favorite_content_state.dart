
import 'package:streamly/data/model/content/favorite/favorite_content_model.dart';

abstract class FavoriteContentState {}

class FavoriteContentInitial extends FavoriteContentState {}

class FavoriteContentLoading extends FavoriteContentState {}

class FavoriteContentLoaded extends FavoriteContentState {
  final List<FavoriteContentModel> favoriteContent;
  FavoriteContentLoaded({required this.favoriteContent});
}

class FavoriteContentError extends FavoriteContentState {
  final String message;
  FavoriteContentError({required this.message});
}
