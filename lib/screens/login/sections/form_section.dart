import 'package:flutter/material.dart';
import 'package:movieapp/blocs/blocs.dart';
import 'package:movieapp/blocs/login/login_state.dart';
import 'package:movieapp/components/components.dart';
import 'package:movieapp/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class FormSection extends StatelessWidget {
  const FormSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final emailError = state.failure?.details?['email'] ??
            (state.email.invalid
                ? context.l10n.invalidInput(context.l10n.email)
                : null);

        final passwordError = state.failure?.details?['password'] ??
            (state.password.invalid
                ? context.l10n.invalidInputCannotEmpty(context.l10n.password)
                : null);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RegularInput(
              label: 'Email',
              key: Key('email_input_login'),
              inputType: TextInputType.emailAddress,
              onChange: (email) {
                context.read<LoginCubit>().emailChanged(email);
              },
              errorText: emailError,
            ),
            const SizedBox(height: 20),
            PasswordInput(
              label: 'Password',
              key: const Key('password_input_login'),
              hintText: context.l10n.inputFieldHint(context.l10n.password),
              onChange: (password) {
                context.read<LoginCubit>().passwordChanged(password);
              },
              errorText: passwordError,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              key: const Key('submit_login_button'),
              onPressed: () => _onLoginSubmitted(context, state),
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 48), backgroundColor: Colors.blue),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                print('register');
              },
              child: Center(child: Text('Register')),
            )
          ],
        );
      },
    );
  }

  // Do action on login button is submitted
  void _onLoginSubmitted(BuildContext context, LoginState state) {
    final cubit = context.read<LoginCubit>();
    if (state.status.isValidated) {
      cubit.submitted();
    } else {
      cubit.validateFields();
    }
  }
}
