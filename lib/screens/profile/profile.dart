import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/blocs/blocs.dart';
import 'package:movieapp/components/components.dart';

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
        body: ListView(
          children: [
            const SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
                child: Text(
              'Sigi Kemahduta',
              style: TextStyle(fontSize: 25),
            )),
            const SizedBox(height: 10),
            ProfileRowContainer(
                leftText: 'Email :', rightText: 'sigikemahduta@gmail.com'),
            ProfileRowContainer(
                leftText: 'Phone :', rightText: '+62-815-4815-3662'),
            ProfileRowContainer(
                leftText: 'Github :', rightText: '@Github/Sigaeasu'),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ElevatedButton(
                key: const Key('submit_login_button'),
                onPressed: () => context.read<AuthCubit>().logout(),
                child: Text('Logout'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 48), backgroundColor: Colors.blue),
              ),
            ),
          ],
        ));
  }
}
