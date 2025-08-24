import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/data/repository/profile/edit_profile/edit_password_repository.dart';

import 'edit_password_event.dart';
import 'edit_password_state.dart';

class EditPasswordBloc extends Bloc<EditPasswordEvent, EditPasswordState> {
  final EditPasswordRepository repository;

  EditPasswordBloc({
    required this.repository,
  }) : super(EditPasswordInitial()) {
    on<EditPasswordSubmitEvent>(_onEditPasswordSubmit);
  }

  void _onEditPasswordSubmit(EditPasswordSubmitEvent event, Emitter<EditPasswordState> emit) async {
    emit(EditPasswordLoading());

    try {
      final passwordUpdateResult = await repository.editPassword(
        event.newPassword,
        event.currentPassword
      );

      if (passwordUpdateResult) {
        emit(EditPasswordSuccess());
      } else {
        emit(EditPasswordFailure(error: 'Failed to edit password'));
      }
    } catch (error) {
      emit(EditPasswordFailure(error: error.toString()));
    }
  }
}
