import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/error_reporter.dart';
import 'package:widgets/input_field_widget.dart';
import 'package:wopta/authentication/validator.dart';
import 'package:wopta/profile/ui/bloc/change_password_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  ChangePasswordScreen({Key? key}) : super(key: key);

  Future<bool> _onWillPop(BuildContext context) async {
    final cubitState = context.read<ChangePasswordCubit>().state;
    if (cubitState is ChangePasswordFailed) {
      context.go('/login');
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePasswordCubit>(
      create: (_) => ChangePasswordCubit(
        reporter: context.read<ErrorReporter>(),
      ),
      child: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () => _onWillPop(context),
            child: FilosofiaScaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  'Cambiare password',
                  style: FilosofiaTheme.of(context).textTheme.appBarTitle,
                ),
                centerTitle: true,
              ),
              body: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                builder: (context, state) {
                  if (state is ChangePasswordInLoad) {
                    return const Center(
                      child: FilosofiaCircularIndicator(),
                    );
                  }
                  if (state is ChangePasswordFailed) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(
                                FilosofiaTheme.of(context).spacing.xxl),
                            child: Icon(
                              Icons.error_outline,
                              size: 90,
                              color: FilosofiaTheme.of(context)
                                  .theme
                                  .materialTheme
                                  .primaryColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    FilosofiaTheme.of(context).spacing.xxl),
                            child: Text(
                              'Non è stato possibile cambiare la password in questo momento',
                              textAlign: TextAlign.center,
                              style: FilosofiaTheme.of(context)
                                  .theme
                                  .materialTheme
                                  .textTheme
                                  .headline5
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  if (state is ChangePasswordSuccessful) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(
                                FilosofiaTheme.of(context).spacing.xxl),
                            child: Icon(
                              Icons.check,
                              size: 90,
                              color: FilosofiaTheme.of(context)
                                  .theme
                                  .materialTheme
                                  .primaryColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    FilosofiaTheme.of(context).spacing.xxl),
                            child: Text(
                              'La password è stata modificata con successo',
                              textAlign: TextAlign.center,
                              style: FilosofiaTheme.of(context)
                                  .theme
                                  .materialTheme
                                  .textTheme
                                  .headline5
                                  ?.copyWith(fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  if (state is ChangePasswordInitial) {
                    return SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                FilosofiaTheme.of(context).spacing.lg,
                              ),
                              child: InputFieldWidget(
                                keyboardType: TextInputType.emailAddress,
                                validator: Validator.validateEmail,
                                controller: _emailController,
                                label: 'Email',
                                autocorrect: false,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  FilosofiaTheme.of(context).spacing.lg),
                              child: InputFieldWidget(
                                label: 'Password',
                                controller: _passwordController,
                                obscure: true,
                                validator: (value) =>
                                    Validator.validatePassword(
                                        password: value!),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  FilosofiaTheme.of(context).spacing.lg),
                              child: InputFieldWidget(
                                label: 'Nuova password',
                                controller: _newPasswordController,
                                validator: (value) =>
                                    Validator.validatePassword(
                                        password: value!),
                                obscure: !state.passwordVisible,
                                suffix: IconButton(
                                  icon: Icon(
                                    state.passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<ChangePasswordCubit>()
                                        .togglePasswordVisibility();
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  FilosofiaTheme.of(context).spacing.xl),
                              child: FilosofiaTextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context
                                        .read<ChangePasswordCubit>()
                                        .changePassword(
                                          _emailController.text,
                                          _passwordController.text,
                                          _newPasswordController.text,
                                        );
                                  }
                                },
                                text: 'Invia',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
