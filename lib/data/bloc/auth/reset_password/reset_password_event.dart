abstract class ResetPasswordEvent {}

class ResetPasswordSubmitEvent extends ResetPasswordEvent {
  final String password;

  ResetPasswordSubmitEvent({
    required this.password,
  });
}
