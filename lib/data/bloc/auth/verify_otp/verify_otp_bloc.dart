import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/data/bloc/auth/verify_otp/verify_otp_event.dart';
import 'package:streamly/data/bloc/auth/verify_otp/verify_otp_state.dart';

import '../../../repository/auth/verify_otp/verify_otp_repository.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final VerifyOtpRepository repository;

  VerifyOtpBloc({required this.repository}) : super(VerifyOtpInitial()) {
    on<VerifyOtpSubmitEvent>(_onVerifyCodeSubmit);
  }

  void _onVerifyCodeSubmit(VerifyOtpSubmitEvent event, Emitter<VerifyOtpState> emit) async {

    emit(VerifyOtpLoading());

    try {
      final isSuccess = await repository.verifyOtp(event.email, event.otp);

      if (isSuccess) {
        emit(VerifyOtpSuccess());
      } else {
        emit(VerifyOtpFailure(error: 'Failed to forget password'));
      }
    } catch (error) {
      emit(VerifyOtpFailure(error: error.toString()));
    }
  }
}
