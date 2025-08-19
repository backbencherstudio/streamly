import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/data/bloc/auth/login/login_event.dart';
import 'package:streamly/data/bloc/auth/login/login_state.dart';
import 'package:streamly/data/repository/auth/login/login_repository.dart';

import '../../../../core/services/token_storage.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginInitial()) {
    on<LoginSubmitEvent>(_onLoginSubmit);
  }

  void _onLoginSubmit(LoginSubmitEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final token = await loginRepository.login(event.email, event.password);

      if (token != null) {
        if (event.rememberMe) {
          await loginRepository.tokenStorage.saveToken(token);
        }
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(error: 'Failed to login'));
      }
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }
}
