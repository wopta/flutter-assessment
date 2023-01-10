import 'package:bloc/bloc.dart';
import 'package:logger/error_reporter.dart';

import '../../data/repository/authentication_repository.dart';
import '../../domain/can_customer_register_use_case.dart';
import '../../domain/model/authentication_errors.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthenticationRepository authenticationRepository;
  final ErrorReporter reporter;
  final CanCustomerRegisterUseCase canCustomerRegisterUseCase;

  RegisterCubit({
    required this.authenticationRepository,
    required this.reporter,
    required this.canCustomerRegisterUseCase,
  }) : super(RegisterInitial());

  void registerAccount({
    required String fiscalCode,
    required String email,
    required String password,
  }) async {
    emit(RegisterInLoad());

    if (!await canCustomerRegisterUseCase.invoke(fiscalCode)) {
      emit(RegisterFailed(error: const UserIsNotClientError()));
      return;
    }

    try {
      await authenticationRepository.signUp(
        email: email,
        password: password,
        fiscalCode: fiscalCode,
      );
      emit(RegisterSuccessful());
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(RegisterFailed(error: e));
    } catch (e, s) {
      reporter.logException(e, s);
      emit(RegisterFailed());
    }
  }
}
