import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/data/repository/profile/edit_profile/edit_profile_image_repository.dart';

import 'edit_profile_image_event.dart';
import 'edit_profile_image_state.dart';

class EditProfileImageBloc extends Bloc<EditProfileImageEvent, EditProfileImageState> {
  final EditProfileImageRepository imageRepository;

  EditProfileImageBloc({
    required this.imageRepository,
  }) : super(EditProfileImageInitial()) {
    on<EditProfileImageSubmitEvent>(_onEditProfileSubmit);
  }

  void _onEditProfileSubmit(EditProfileImageSubmitEvent event, Emitter<EditProfileImageState> emit) async {
    emit(EditProfileImageLoading());

    try {
      final result = await imageRepository.updateUserDetails(event.imagePath);
      if (result) {
        emit(EditProfileImageSuccess());
      } else {
        emit(EditProfileImageFailure(error: 'Failed to Save Photo'));
      }
    } catch (error) {
      emit(EditProfileImageFailure(error: error.toString()));
    }
  }
}
