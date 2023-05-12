import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/blocs/blocs.dart';
import 'package:movieapp/blocs/login/login_state.dart';
import 'package:movieapp/components/components.dart';
import 'package:movieapp/screens/login/sections/form_section.dart';
import 'package:movieapp/utils/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<LoginCubit>(),
      child: LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _loadingDiloagIsOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state.status.isSubmissionInProgress) {
                _showLoadingDialog();
              } else if (state.status.isSubmissionFailure) {
                _onLoginFailure(state.failure);
              } else if (state.status.isSubmissionSuccess) {
                _onLoginSuccessfully();
              }
            },
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: 100,
                horizontal: 32,
              ),
              children: [
                Column(
                  children: [
                    SizedBox(height: 8),
                    Text('MovieApp',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.4,
                            fontSize: 28,
                            color: Colors.blue.shade500,)),
                    SizedBox(height: 100),
                    FormSection()
                  ],
                )
              ],
            )));
  }

  // Do action when login is failure
  void _onLoginFailure(ErrorException? error) {
    _dismissLoadingDialog();
    context.showErrorSnackBar(title: error?.getDetailsMessage);
  }

  // Do action when login is successfully
  void _onLoginSuccessfully() {
    Future<dynamic>.delayed(const Duration(seconds: 1)).whenComplete(() {
      _dismissLoadingDialog();
      context.read<AuthCubit>().initialize();
    });
  }

  // Dismiss loading dialog, if it is open
  void _dismissLoadingDialog() {
    if (mounted) {
      if (_loadingDiloagIsOpen) Navigator.of(context).pop();
      setState(() {
        _loadingDiloagIsOpen = false;
      });
    }
  }

  // Show loading dialog, if it is not open
  void _showLoadingDialog() {
    if (mounted) {
      if (!_loadingDiloagIsOpen) {
        context.showLoadingDialog().whenComplete(() {
          setState(() {
            _loadingDiloagIsOpen = false;
          });
        });
      }
      setState(() {
        _loadingDiloagIsOpen = true;
      });
    }
  }
}
