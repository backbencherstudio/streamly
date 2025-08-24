import 'dart:io';

abstract class EditProfileEvent {}

class EditProfileSubmitEvent extends EditProfileEvent {
  final String name;
  final String email;
  final String phone_number;

  EditProfileSubmitEvent({
    required this.name,
    required this.email,
    required this.phone_number,
  });
}