part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.valid = false,
    this.loading = false,
    this.success = false,
    this.failure = false,
    this.errorMessage = '',
  });

  final String email;
  final String password;
  final bool valid;
  final bool loading;
  final bool success;
  final bool failure;
  final String? errorMessage;

  @override
  List<Object> get props => [email, password, valid, loading, success, failure];

  LoginState copyWith({
    String? email,
    String? password,
    bool? valid,
    bool? loading,
    bool? success,
    bool? failure,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      valid: valid ?? this.valid,
      loading: loading ?? this.loading,
      success: success ?? this.success,
      failure: failure ?? this.failure,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
