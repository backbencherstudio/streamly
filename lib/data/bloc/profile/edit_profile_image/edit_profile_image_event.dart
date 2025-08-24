import 'dart:io';

abstract class EditProfileImageEvent {}

class EditProfileImageSubmitEvent extends EditProfileImageEvent {
  final File? imagePath;

  EditProfileImageSubmitEvent({
    required this.imagePath,
  });
}