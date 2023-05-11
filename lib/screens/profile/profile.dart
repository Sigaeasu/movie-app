import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/blocs/blocs.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: ElevatedButton(
        key: const Key('submit_login_button'),
        onPressed: () => context.read<AuthCubit>().logout(),
        child: Text('Logout'),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(300, 48), backgroundColor: Colors.blue),
      ),
    );
  }
}
