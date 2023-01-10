import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/error_reporter.dart';
import 'package:wopta/authentication/data/repository/authentication_repository.dart';
import 'package:wopta/authentication/domain/can_customer_register_use_case.dart';
import 'package:wopta/authentication/data/repository/user_repository.dart';
import 'package:wopta/authentication/ui/screen/register_form.dart';

import '../bloc/register_cubit.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return FilosofiaScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Registrazione',
          style: FilosofiaTheme.of(context).textTheme.appBarTitle,
        ),
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => RegisterCubit(
            authenticationRepository: context.read<AuthenticationRepository>(),
            reporter: context.read<ErrorReporter>(),
            canCustomerRegisterUseCase: CanCustomerRegisterUseCase(
              userRepository: context.read<UserRepository>(),
            ),
          ),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
