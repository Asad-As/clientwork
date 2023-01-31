import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spoken_core_player/core/utils/routes/routes_name.dart';
import 'package:spoken_core_player/features/home/home_view.dart';

import 'core/const/app_colors.dart';
import 'core/utils/routes/routes.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //to change the color of status bar

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor:
        AppColors.whiteColor, //or set color with: Color(0xFF0000FF)
        statusBarIconBrightness: Brightness.dark));

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(390, 844),
    //  child: const IntroductionView(),
      builder: (context, child) {
        return MaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'Spoken-Core',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          initialRoute: RoutesName.Home,
           onGenerateRoute: Routes.generateRoute,
          home: HomeView(),
        );
      },
    );
  }
}