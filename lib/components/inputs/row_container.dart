import 'package:flutter/cupertino.dart';

class RowContainer extends StatelessWidget {
  const RowContainer(
      {Key? key, required this.leftWidget, required this.rightWidget})
      : super(key: key);

  final Widget leftWidget;
  final Widget rightWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leftWidget,
        Spacer(),
        rightWidget,
      ],
    );
  }
}
