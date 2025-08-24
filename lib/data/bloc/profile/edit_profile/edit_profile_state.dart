abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {}

class EditProfileFailure extends EditProfileState {
  final String error;

  EditProfileFailure({required this.error});
}
