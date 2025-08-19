abstract class ForgetPasswordEvent {}

class ForgetPasswordSubmitEvent extends ForgetPasswordEvent {
  final String email;

  ForgetPasswordSubmitEvent({
    required this.email,
  });
}
