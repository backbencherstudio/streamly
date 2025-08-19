import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/data/bloc/auth/sign_up/sign_up_event.dart';
import 'package:streamly/data/bloc/auth/sign_up/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial());

  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpSubmitEvent) {
      yield SignUpLoading();
      try {

        yield SignUpSuccess();
      } catch (error) {
        yield SignUpFailure(error: error.toString());
      }
    }
  }
}
