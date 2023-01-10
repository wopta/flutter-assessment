import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/error_reporter.dart';
import 'package:wopta/authentication/ui/model/app_user_model.dart';

import '../../data/repository/authentication_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.authenticationRepository, required this.reporter})
      : super(const AppState.loading()) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppUpdateUserDataRequested>(_onUpdateUserDataRequested);

    _userSubscription = authenticationRepository.user.listen(
      (user) => add(AppUserChanged(user)),
    );
  }

  final AuthenticationRepository authenticationRepository;
  final ErrorReporter reporter;
  late final StreamSubscription<AppUserModel> _userSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    if (event.user.isNotEmpty) {
      reporter.setUserId(event.user.id);
    }
    emit(
      event.user.isNotEmpty
          ? AppState.authenticated(event.user)
          : const AppState.unauthenticated(),
    );
  }

  void _onUpdateUserDataRequested(
      AppUpdateUserDataRequested event, Emitter<AppState> emit) async {
    await authenticationRepository.reloadUser();
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}

class AuthStateNotifier extends ChangeNotifier {
  late final StreamSubscription<AppState> _blocStream;

  AuthStateNotifier(AppBloc bloc) {
    _blocStream = bloc.stream.listen((event) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _blocStream.cancel();
    super.dispose();
  }
}
