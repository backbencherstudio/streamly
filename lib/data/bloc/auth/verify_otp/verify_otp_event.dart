abstract class VerifyOtpEvent {}

class VerifyOtpSubmitEvent extends VerifyOtpEvent {
  final String email;
  final String otp;

  VerifyOtpSubmitEvent({
    required this.email,
    required this.otp,
  });
}
