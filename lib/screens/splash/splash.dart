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
        // if (state.status == AuthenticationStatus.unAuthenticated) {
        //   context.read<NotificationCubit>().tokenResetted();
        // }
      },
      builder: (context, state) {
        // Check current authentication state
        // If user is authenticated, show Home/Main Page
        if (state.status == AuthenticationStatus.authenticated) {
          return MainPage();
          // return AddMitraPage();
        }
        // If user is not authenticated, show login page
        else if (state.status == AuthenticationStatus.unAuthenticated) {
          return LoginPage();
        }

        return const Scaffold();
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:movieapp/screens/screens.dart';

// class SplashPage extends StatefulWidget {
//   const SplashPage({Key? key}) : super(key: key);

//   static const routeName = '/';

//   @override
//   _SplashPageView createState() => _SplashPageView();
// }

// class _SplashPageView extends State<SplashPage> {
//   @override
//   void initState() {
//     print('masuk');
//     super.initState();
//     _navigateHome();
//   }

//   void _navigateHome() async {
//     await Future.delayed(Duration(milliseconds: 1500), () {});
//     print('ada sisini');
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => MainPage()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Container(
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           Icon(Icons.movie, color: Colors.blue[300], size: 150),
//           Text(
//             'MovieApp',
//             style: TextStyle(
//               fontSize: 40,
//               color: Colors.blue[300],
//             ),
//           )
//         ]),
//       )),
//     );
//   }
// }
