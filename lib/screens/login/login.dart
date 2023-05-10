import 'package:flutter/material.dart';
import 'package:movieapp/components/components.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const RegularInput(
                  key: Key('email_input_login'),
                  inputType: TextInputType.emailAddress,
                  label: 'Email',
                ),
                const SizedBox(height: 20),
                PasswordInput(
                  key: const Key('password_input_login'),
                  label: 'Password',
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  key: const Key('submit_login_button'),
                  onPressed: () => {},
                  child: Text(
                    'Login',
                  ),
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
            )
          ],
        )
      ],
    ));
  }
}
