import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/data/bloc/auth/forget_password/forget_password_event.dart';
import 'package:streamly/data/bloc/auth/forget_password/forget_password_state.dart';
import 'package:streamly/data/repository/auth/forget_password/forget_password_repository.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final ForgetPasswordRepository repository;

  String? _email;
  String? get email => _email;

  ForgetPasswordBloc({required this.repository}) : super(ForgetPasswordInitial()) {
    on<ForgetPasswordSubmitEvent>(_onForgetPasswordSubmit);
  }

  void _onForgetPasswordSubmit(ForgetPasswordSubmitEvent event, Emitter<ForgetPasswordState> emit) async {

    _email = event.email;

    emit(ForgetPasswordLoading());

    try {
      final isSuccess = await repository.forgetPassword(event.email);

      if (isSuccess) {
        emit(ForgetPasswordSuccess());
      } else {
        emit(ForgetPasswordFailure(error: 'Failed to forget password'));
      }
    } catch (error) {
      emit(ForgetPasswordFailure(error: error.toString()));
    }
  }
}
