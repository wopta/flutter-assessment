import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:widgets/input_field_widget.dart';
import 'package:widgets/show_snackbar.dart';
import 'package:widgets/widgets.dart';
import 'package:wopta/authentication/ui/bloc/register_cubit.dart';

import '../../../../../../../authentication/validator.dart';
import '../../domain/model/authentication_errors.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late FToast fToast;
  var _passwordVisible = false;

  final _fiscalCodeTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessful) {
          context.loaderOverlay.hide();
          showSnackBar(context, false, 'Registrazione riuscita');
          return;
        }
        if (state is RegisterFailed) {
          context.loaderOverlay.hide();
          if (state.error is EmailAlreadyInUseError) {
            showSnackBar(
              context,
              true,
              'Impossibile proseguire con la registrazione. Email già registrata.',
            );
            return;
          }
          if (state.error is UserIsNotClientError) {
            showSnackBar(
              context,
              true,
              'Non risultano polizze con Wopta. Scrivi info@wopta.it in caso di problematiche.',
            );
            return;
          }
          showSnackBar(context, true, 'Impossibile registrarsi al momento');
          return;
        }
        if (state is RegisterInLoad) {
          context.loaderOverlay.show();
          return;
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: FilosofiaTheme.of(context).spacing.xl,
                    vertical: FilosofiaTheme.of(context).spacing.lg,
                  ),
                  child: SvgPicture.asset(
                    "assets/images/wopta-logo.svg",
                    height: 64,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(FilosofiaTheme.of(context).spacing.lg),
                  child: InputFieldWidget(
                    inputFormatters: [UpperCaseTextFormatter()],
                    validator: Validator.validateItalianFiscalCode,
                    controller: _fiscalCodeTextController,
                    label: 'Codice Fiscale',
                    autocorrect: false,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(FilosofiaTheme.of(context).spacing.lg),
                  child: InputFieldWidget(
                    label: 'E-mail',
                    controller: _emailTextController,
                    validator: Validator.validateEmail,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(FilosofiaTheme.of(context).spacing.lg),
                  child: InputFieldWidget(
                    controller: _passwordTextController,
                    label: 'Password',
                    obscure: !_passwordVisible,
                    validator: (value) =>
                        Validator.validatePassword(password: value!),
                    suffix: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(FilosofiaTheme.of(context).spacing.xl),
                  child: FilosofiaTextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        context.read<RegisterCubit>().registerAccount(
                              fiscalCode: _fiscalCodeTextController.text,
                              email: _emailTextController.text,
                              password: _passwordTextController.text,
                            );
                      }
                    },
                    text: 'Registrati',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("Registrazione effettuata con successo"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 4),
    );
  }

  showErrorToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error,
            color: Colors.white,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "Registrazione fallita!",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 4),
    );
  }
}

/*
                  MaterialButton(
                    color: Theme.of(context).colorScheme.primary,
                    height: 50,
                    minWidth: 180,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        User? user = await FireAuth.registerUsingEmailPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text,
                        );

                        addUser() {
                          users.doc(user!.uid).set({
                            'uid': user.uid,
                            'codiceFiscale': _fiscalCodeTextController.text,
                            'role': BusinessConstants.ROLE_CUSTOMER,
                          });
                        }

                        if (user != null) {
                          addUser();
                          showToast();

                          if (!mounted) return;
                          context.go(LoginRoutes.root);
                        } else {
                          showErrorToast();
                        }
                      }
                    },
                    child: const Text(
                      'Registrati',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  */
