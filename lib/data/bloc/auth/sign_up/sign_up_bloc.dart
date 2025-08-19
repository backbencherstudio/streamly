import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/data/bloc/auth/sign_up/sign_up_event.dart';
import 'package:streamly/data/bloc/auth/sign_up/sign_up_state.dart';
import '../../../repository/auth/sign_up/sign_up_repository.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepository signUpRepository;

  SignUpBloc({required this.signUpRepository}) : super(SignUpInitial()) {
    on<SignUpSubmitEvent>(_onSignUpSubmit);
  }

  void _onSignUpSubmit(SignUpSubmitEvent event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());

    try {
      final isSuccess = await signUpRepository.signUp(event.email, event.name, event.password);

      if (isSuccess) {
        emit(SignUpSuccess());
      } else {
        emit(SignUpFailure(error: 'Failed to sign up'));
      }
    } catch (error) {
      emit(SignUpFailure(error: error.toString()));
    }
  }
}
