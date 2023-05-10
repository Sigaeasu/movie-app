import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/blocs/blocs.dart';
import 'package:movieapp/screens/screens.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return SplashView();
  }
}

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        //
      },
      builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return MainPage();
        } else if (state.status == AuthenticationStatus.unAuthenticated) {
          return LoginPage();
        }

        return Scaffold(
          body: Center(
              child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.movie, color: Colors.blue[300], size: 150),
              Text(
                'MovieApp',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue[300],
                ),
              )
            ]),
          )),
        );
      },
    );
  }
}
