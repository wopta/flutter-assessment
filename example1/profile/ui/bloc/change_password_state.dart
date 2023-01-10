part of 'change_password_cubit.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {
  final bool passwordVisible;

  ChangePasswordInitial({required this.passwordVisible});
}

class ChangePasswordInLoad extends ChangePasswordState {}

class ChangePasswordSuccessful extends ChangePasswordState {}

class ChangePasswordFailed extends ChangePasswordState {}
