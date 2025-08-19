abstract class SignUpEvent {}

class SignUpSubmitEvent extends SignUpEvent {
  final String email;
  final String name;
  final String password;

  SignUpSubmitEvent({
    required this.email,
    required this.name,
    required this.password,
  });
}
