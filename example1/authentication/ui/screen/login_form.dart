import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:navigator/home_navigation.dart';
import 'package:widgets/input_field_widget.dart';
import 'package:widgets/show_snackbar.dart';
import 'package:wopta/authentication/ui/bloc/login_cubit.dart';

import '../../../../../../../authentication/validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailPhone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _passwordVisible = false;

  void submitLogin() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().logInWithCredentials();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (BuildContext context, state) {
        ScaffoldMessenger.of(context).clearSnackBars();
        if (state.success) {
          context.go(CustomerHomeRoutes.products);
          return;
        }
        if (state.failure) {
          showSnackBar(context, true, 'Email o password errate');
          context.loaderOverlay.hide();
          return;
        }
        if (state.loading) {
          context.loaderOverlay.show();
          return;
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: FilosofiaTheme.of(context).spacing.md_lg,
                  vertical: FilosofiaTheme.of(context).spacing.sm_md,
                ),
                width: 550,
                child: InputFieldWidget(
                  keyboardType: TextInputType.emailAddress,
                  validator: Validator.validateEmail,
                  controller: _emailPhone,
                  label: 'Email',
                  autocorrect: false,
                  onChanged: context.read<LoginCubit>().emailChanged,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: FilosofiaTheme.of(context).spacing.md_lg,
                  vertical: FilosofiaTheme.of(context).spacing.sm_md,
                ),
                width: 550,
                child: InputFieldWidget(
                  controller: _password,
                  label: 'Password',
                  obscure: !_passwordVisible,
                  validator: (value) =>
                      Validator.validatePassword(password: value!),
                  onChanged: context.read<LoginCubit>().passwordChanged,
                  suffix: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  onFieldSubmitted: (_) => submitLogin(),
                ),
              ),
              const SizedBox(
                height: 36.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: FilosofiaTheme.of(context).spacing.xl,
                  vertical: FilosofiaTheme.of(context).spacing.lg,
                ),
                child: FilosofiaTextButton(
                  onPressed: () => submitLogin(),
                  text: 'Accedi',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
