abstract class LoginEvent {}

class LoginSubmitEvent extends LoginEvent {
  final String email;
  final String password;
  final bool rememberMe;

  LoginSubmitEvent({
    required this.email,
    required this.password,
    required this.rememberMe,
  });
}
