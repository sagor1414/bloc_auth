import 'package:bloc_sportyo/core/utils/shared_pref_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../../../domain/usecases/login_usecase.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final SharedPrefHelper sharedPrefHelper;

  LoginBloc(this.loginUseCase, this.sharedPrefHelper) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  void _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final user = await loginUseCase(event.email, event.password);

      // Save token and user ID in SharedPreferences
      await sharedPrefHelper.saveUserData(user.token, user.id);

      emit(LoginSuccess(user.token));
    } catch (error) {
      emit(LoginFailure(error.toString()));
    }
  }
}
