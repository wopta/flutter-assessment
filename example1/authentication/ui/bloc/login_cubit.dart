import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logger/error_reporter.dart';
import 'package:wopta/authentication/validator.dart';
import 'package:wopta/authentication/ui/model/app_user_model.dart';

import '../../data/repository/authentication_repository.dart';
import '../../domain/model/authentication_errors.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository, this.reporter)
      : super(const LoginState()) {
    _userSubscription = _authenticationRepository.user.listen(
      (user) {
        if (user.isNotEmpty) {
          emit(state.copyWith(success: true, loading: false, failure: false));
        }
      },
      onError: (_) {
        emit(state.copyWith(success: false, loading: false, failure: true));
        emit(state.copyWith(success: false, loading: false, failure: false));
      },
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final ErrorReporter reporter;
  late StreamSubscription<AppUserModel> _userSubscription;

  void emailChanged(String value) {
    emit(state.copyWith(success: false, failure: false));
    final valid = Validator.validateEmail(value) == null &&
        Validator.validatePassword(password: state.password) == null;
    emit(
      state.copyWith(
        email: value,
        valid: valid,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(state.copyWith(success: false, failure: false));
    final valid = Validator.validateEmail(value) == null &&
        Validator.validatePassword(password: state.password) == null;
    emit(
      state.copyWith(
        password: value,
        valid: valid,
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    emit(state.copyWith(loading: true));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          failure: true,
          loading: false,
          success: false,
        ),
      );
    } catch (e, s) {
      reporter.logException(e, s);
      emit(state.copyWith(success: false, loading: false, failure: true));
    }
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
