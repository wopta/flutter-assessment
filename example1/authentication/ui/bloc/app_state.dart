part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
  loading
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = AppUserModel.empty,
  });

  const AppState.authenticated(AppUserModel user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  const AppState.loading(): this._(status: AppStatus.loading);

  final AppStatus status;
  final AppUserModel user;

  @override
  List<Object> get props => [status, user];
}
