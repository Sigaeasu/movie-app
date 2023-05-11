import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/blocs/blocs.dart';
import 'package:movieapp/components/components.dart';
import 'package:movieapp/screens/login/sections/form_section.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
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
                    fontSize: 28)),
            SizedBox(height: 100),
            FormSection()
          ],
        )
      ],
    ));
  }
}
