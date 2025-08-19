import '../../../model/auth/user/user_model.dart';

abstract class GetMeState {}

class GetMeInitial extends GetMeState {}

class GetMeLoading extends GetMeState {}

class GetMeSuccess extends GetMeState {
  final UserModel user;

  GetMeSuccess({required this.user});
}

class GetMeFailure extends GetMeState {
  final String error;

  GetMeFailure({required this.error});
}
