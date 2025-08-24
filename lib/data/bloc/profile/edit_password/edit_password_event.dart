
abstract class EditPasswordEvent {}

class EditPasswordSubmitEvent extends EditPasswordEvent {
  final String newPassword;
  final String currentPassword;

  EditPasswordSubmitEvent({
    required this.newPassword,
    required this.currentPassword,
  });
}