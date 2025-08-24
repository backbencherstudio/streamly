abstract class EditPasswordState {}

class EditPasswordInitial extends EditPasswordState {}

class EditPasswordLoading extends EditPasswordState {}

class EditPasswordSuccess extends EditPasswordState {}

class EditPasswordFailure extends EditPasswordState {
  final String error;

  EditPasswordFailure({required this.error});
}
