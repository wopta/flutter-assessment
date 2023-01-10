import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/error_reporter.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ErrorReporter reporter;

  ChangePasswordCubit({required this.reporter})
      : super(ChangePasswordInitial(passwordVisible: false));

  void togglePasswordVisibility() {
    if (state is ChangePasswordInitial) {
      emit(
        ChangePasswordInitial(
          passwordVisible: !(state as ChangePasswordInitial).passwordVisible,
        ),
      );
    }
  }

  void changePassword(
    String email,
    String oldPassword,
    String newPassword,
  ) async {
    emit(ChangePasswordInLoad());

    final credential =
        EmailAuthProvider.credential(email: email, password: oldPassword);
    final user = FirebaseAuth.instance.currentUser!;

    try {
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
    } catch (e, s) {
      reporter.logException(e, s);
      emit(ChangePasswordFailed());
      return;
    }

    emit(ChangePasswordSuccessful());
  }
}
