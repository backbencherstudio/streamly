import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/data/bloc/profile/edit_profile/edit_profile_event.dart';
import 'package:streamly/data/bloc/profile/edit_profile/edit_profile_state.dart';
import 'package:streamly/data/repository/profile/edit_profile/edit_profile_repository.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final EditProfileRepository repository;

  EditProfileBloc({
    required this.repository,
  }) : super(EditProfileInitial()) {
    on<EditProfileSubmitEvent>(_onEditProfileSubmit);
  }

  void _onEditProfileSubmit(EditProfileSubmitEvent event, Emitter<EditProfileState> emit) async {
    emit(EditProfileLoading());

    try {
      final profileUpdateResult = await repository.editProfileData(
        event.email,
        event.name,
        event.phone_number,
      );

      if (profileUpdateResult) {
        emit(EditProfileSuccess());
      } else {
        emit(EditProfileFailure(error: 'Failed to edit profile'));
      }
    } catch (error) {
      emit(EditProfileFailure(error: error.toString()));
    }
  }
}
