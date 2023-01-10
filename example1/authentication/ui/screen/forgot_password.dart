import 'package:filosofia/filosofia.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/error_reporter.dart';
import 'package:provider/provider.dart';
import 'package:widgets/input_field_widget.dart';
import 'package:widgets/show_snackbar.dart';
import 'package:wopta/authentication/validator.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailPhone = TextEditingController();
  late FToast fToast;

  @override
  void dispose() {
    _emailPhone.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return FilosofiaScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Recupero password',
          style: FilosofiaTheme.of(context).textTheme.appBarTitle,
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: FilosofiaTheme.of(context).spacing.xl,
            ),
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
                  padding: EdgeInsets.only(
                      top: FilosofiaTheme.of(context).spacing.xl),
                  child: Text(
                    'Inserisci il tuo indirizzo e-mail per reimpostare la password',
                    style: FilosofiaTheme.of(context)
                        .theme
                        .materialTheme
                        .textTheme
                        .headline6,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: FilosofiaTheme.of(context).spacing.xl),
                  child: InputFieldWidget(
                    keyboardType: TextInputType.emailAddress,
                    validator: Validator.validateEmail,
                    controller: _emailPhone,
                    label: 'E-mail',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: FilosofiaTheme.of(context).spacing.xl),
                  child: Center(
                    child: FilosofiaTextButton(
                      onPressed: resetPassword,
                      text: 'Invia mail',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future resetPassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailPhone.text.trim());
        if (!mounted) return;
        showSnackBar(context, false, "Email inviata con successo");
      } on FirebaseAuthException catch (e, s) {
        Provider.of<ErrorReporter>(context).logException(e, s);
        showSnackBar(context, false, "Email inviata con successo");
      }
    }
  }
}
