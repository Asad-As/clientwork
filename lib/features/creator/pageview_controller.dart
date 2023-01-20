
import 'package:flutter/material.dart';
import 'package:spoken_core_player/features/creator/creator_view.dart';
import 'package:spoken_core_player/features/creator/subjectView.dart';
import 'package:spoken_core_player/features/spoken_post/spokenpost_view.dart';

class PageViewController extends StatefulWidget {

  @override
  PageViewControllerState createState() => PageViewControllerState();
}

class PageViewControllerState extends State<PageViewController> {
  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: PageView(
            controller: controller,
            onPageChanged: (page) => {print(page.toString())},
            pageSnapping: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              CreatorView(),
              SubjectView(),
              SpokenPostView(),
            ],
          ),
        ));
  }
}