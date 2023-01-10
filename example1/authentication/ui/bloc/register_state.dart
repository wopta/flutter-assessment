part of 'register_cubit.dart';

abstract class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {}

class RegisterInLoad extends RegisterState {}

class RegisterSuccessful extends RegisterState {}

class RegisterFailed extends RegisterState {
  final Exception? error;
  RegisterFailed({this.error});
}
