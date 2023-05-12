import 'package:flutter/material.dart';

class ProfileRowContainer extends StatelessWidget {
  const ProfileRowContainer(
      {Key? key, required this.leftText, required this.rightText})
      : super(key: key);

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              leftText,
              style: TextStyle(color: Colors.grey),
            ),
            Spacer(),
            Text(rightText)
          ],
        ));
  }
}
