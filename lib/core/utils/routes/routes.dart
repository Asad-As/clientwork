import 'package:flutter/material.dart';
import 'package:spoken_core_player/core/utils/routes/routes_name.dart';
import 'package:spoken_core_player/features/creator/creator_view.dart';
import 'package:spoken_core_player/features/creator/pageview_controller.dart';
import 'package:spoken_core_player/features/creator/subjectView.dart';
import 'package:spoken_core_player/features/home/home_view.dart';
import 'package:spoken_core_player/features/videoScreen/video_view.dart';

import '../../../features/spoken_post/spokenpost_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.Home:
        return MaterialPageRoute(builder: (_) => const HomeView());
         case RoutesName.videoplayer:
        return MaterialPageRoute(builder: (_) =>  VideoView(index: 2,));
      case RoutesName.Creator:
         return MaterialPageRoute(builder: (_) => const CreatorView());
       case RoutesName.Subject:
         return MaterialPageRoute(builder: (_) => const SubjectView());
       case RoutesName.SpokenPost:
         return MaterialPageRoute(builder: (_) => const SpokenPostView());
         case RoutesName.controller:
         return MaterialPageRoute(builder: (_) => PageViewController());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No Route Found'),
                  ),
                ));
    }
  }
}
