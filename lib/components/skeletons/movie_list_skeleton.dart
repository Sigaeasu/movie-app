import 'package:flutter/material.dart';
import 'package:movieapp/components/components.dart';
import 'package:movieapp/screens/screens.dart';

import 'package:skeletons/skeletons.dart';

class MoviesListSkeleton extends StatelessWidget {
  const MoviesListSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonParagraph(
            style: SkeletonParagraphStyle(
                lines: 10,
                spacing: 10,
                lineStyle: SkeletonLineStyle(
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
