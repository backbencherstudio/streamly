import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamly/data/bloc/auth/getMe/get_me_event.dart';
import 'package:streamly/data/bloc/auth/getMe/get_me_state.dart';

import '../../../model/auth/user/user_model.dart';
import '../../../repository/auth/user/user_repository.dart';

class GetMeBloc extends Bloc<GetMeEvent, GetMeState> {
  final UserRepository userRepository;

  GetMeBloc({required this.userRepository}) : super(GetMeInitial()) {
    on<GetMeFetchEvent>(_onGetMeRequest);
  }

  Future<void> _onGetMeRequest(GetMeFetchEvent event, Emitter<GetMeState> emit) async {
    emit(GetMeLoading());

    try {
      final UserModel userModel = await userRepository.getUser();
      emit(GetMeSuccess(user: userModel));
    } catch (e) {
      emit(GetMeFailure(error: e.toString()));
    }
  }
}
