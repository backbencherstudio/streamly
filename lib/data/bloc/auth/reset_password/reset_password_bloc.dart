import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/data/bloc/auth/reset_password/reset_password_event.dart';
import 'package:streamly/data/bloc/auth/reset_password/reset_password_state.dart';
import 'package:streamly/data/repository/auth/reset_password/reset_password_repository.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordRepository repository;

  ResetPasswordBloc({required this.repository}) : super(ResetPasswordInitial()) {
    on<ResetPasswordSubmitEvent>(_onResetPasswordSubmit);
  }

  void _onResetPasswordSubmit(ResetPasswordSubmitEvent event, Emitter<ResetPasswordState> emit) async {

    emit(ResetPasswordLoading());

    try {
      final isSuccess = await repository.resetPassword(event.password);
      if (isSuccess) {
        emit(ResetPasswordSuccess());
      } else {
        emit(ResetPasswordFailure(error: 'Failed to reset password'));
      }
    } catch (error) {
      emit(ResetPasswordFailure(error: error.toString()));
    }
  }
}
