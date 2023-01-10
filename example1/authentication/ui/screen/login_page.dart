import 'package:filosofia/filosofia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/error_reporter.dart';
import 'package:widgets/text_divider.dart';
import 'package:wopta/authentication/ui/screen/login_form.dart';

import '../../data/repository/authentication_repository.dart';
import '../bloc/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return FilosofiaScaffold(
      isConstrained: true,
      body: SingleChildScrollView(
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
            BlocProvider<LoginCubit>(
              create: (_) => LoginCubit(
                context.read<AuthenticationRepository>(),
                context.read<ErrorReporter>(),
              ),
              child: const LoginForm(),
            ),
            Container(
              padding: EdgeInsets.only(
                top: FilosofiaTheme.of(context).spacing.lg,
                bottom: FilosofiaTheme.of(context).spacing.md,
              ),
              child: GestureDetector(
                onTap: () {
                  context.go('/login/recoverpassword');
                },
                child: Text(
                  'Recupera password',
                  style:
                      FilosofiaTheme.of(context).textTheme.lightButtonTextTheme,
                ),
              ),
            ),
            TextDivider(
              text: 'Oppure',
              padding: EdgeInsets.symmetric(
                horizontal: FilosofiaTheme.of(context).spacing.xxl,
                vertical: FilosofiaTheme.of(context).spacing.md,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: FilosofiaTheme.of(context).spacing.lg,
                top: FilosofiaTheme.of(context).spacing.md,
              ),
              child: GestureDetector(
                onTap: () {
                  context.go('/login/register');
                },
                child: Text(
                  'Registrati',
                  style:
                      FilosofiaTheme.of(context).textTheme.lightButtonTextTheme,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 80),
            ),
          ],
        ),
      ),
    );
  }
}
