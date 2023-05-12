import 'package:flutter/material.dart';

import 'package:skeletons/skeletons.dart';

class MovieDetailSkeleton extends StatelessWidget {
  const MovieDetailSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
                width: double.infinity,
                height: 200,
                padding: EdgeInsets.only(top: 20),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          SkeletonParagraph(
            style: SkeletonParagraphStyle(
                lines: 5,
                spacing: 10,
                lineStyle: SkeletonLineStyle(
                  randomLength: true,
                  height: 40,
                  borderRadius: BorderRadius.circular(8),
                  minLength: MediaQuery.of(context).size.width / 2,
                )),
          ),
        ],
      ),
    );
  }
}
