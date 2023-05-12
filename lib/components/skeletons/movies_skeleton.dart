import 'package:flutter/material.dart';
import 'package:movieapp/components/components.dart';
import 'package:movieapp/screens/screens.dart';

import 'package:skeletons/skeletons.dart';

class MoviesSkeleton extends StatelessWidget {
  const MoviesSkeleton({Key? key}) : super(key: key);

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
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                height: 50,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, bottom: 10),
              child: Text('Category',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
                width: double.infinity,
                height: 100,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: RowContainer(
                leftWidget: Text('Now Playing',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                rightWidget: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(MovieListPage.routeName);
                    },
                    child: Text('See All'))),
          ),
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
                width: double.infinity,
                height: 200,
                padding: EdgeInsets.symmetric(vertical: 20),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ],
      ),
    );
  }
}
