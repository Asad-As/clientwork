import 'package:flutter/material.dart';
import 'package:spoken_core_player/core/common_widgets/Custom_Text.dart';
import 'package:spoken_core_player/core/const/app_colors.dart';
import 'package:spoken_core_player/core/images/image_Path.dart';

import '../../core/utils/routes/routes_name.dart';
class CreatorView extends StatelessWidget {
  const CreatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lesswhiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: custom_Text(Txt: "QuietWispers", Size: 12, weight: FontWeight.w400, color: AppColors.offwhiteColor, theme: true),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Center(
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context,RoutesName.Subject);
          },
          child: CircleAvatar(
            radius: 30,
            child: Image.asset(Image_Path.profile_pic), //Text
          ),
        ),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  custom_Text(Txt: "ID", Size: 16, weight: FontWeight.w300, color: AppColors.fontcolor, theme: true),
                  custom_Text(Txt: "12390", Size: 16, weight: FontWeight.w300, color: AppColors.fontcolor, theme: true),

                ],
              ),
            ),
            Divider(
              height: 2,
              thickness: 1,
              color: AppColors.devidercolor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  custom_Text(Txt: "Type", Size: 16, weight: FontWeight.w300, color: AppColors.fontcolor, theme: true),
                  custom_Text(Txt: "Creater", Size: 16, weight: FontWeight.w300, color: AppColors.fontcolor, theme: true),

                ],
              ),
            ),
            Divider(
              height: 2,
              thickness: 1,
              color: AppColors.devidercolor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  custom_Text(Txt: "Name", Size: 16, weight: FontWeight.w300, color: AppColors.fontcolor, theme: true),
                  custom_Text(Txt: "QuietWispers", Size: 16, weight: FontWeight.w300, color: AppColors.fontcolor, theme: true),

                ],
              ),
            ),
            Divider(
              height: 2,
              thickness: 1,
              color: AppColors.devidercolor,
            ),

          ],
        ),
      ),
    );
  }
}
