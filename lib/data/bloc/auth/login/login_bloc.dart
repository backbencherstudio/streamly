import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/data/bloc/auth/login/login_event.dart';
import 'package:streamly/data/bloc/auth/login/login_state.dart';
import 'package:streamly/data/repository/auth/login/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginInitial()) {
    on<LoginSubmitEvent>(_onLoginSubmit);
  }

  void _onLoginSubmit(LoginSubmitEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final isSuccess = await loginRepository.login(event.email, event.password);

      if (isSuccess) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(error: 'Failed to sign up'));
      }
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }
}
