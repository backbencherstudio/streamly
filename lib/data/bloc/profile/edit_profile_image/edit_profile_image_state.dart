abstract class EditProfileImageState {}

class EditProfileImageInitial extends EditProfileImageState {}

class EditProfileImageLoading extends EditProfileImageState {}

class EditProfileImageSuccess extends EditProfileImageState {}

class EditProfileImageFailure extends EditProfileImageState {
  final String error;

  EditProfileImageFailure({required this.error});
}
