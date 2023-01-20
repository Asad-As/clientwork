import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spoken_core_player/core/common_widgets/Custom_Text.dart';
import 'package:spoken_core_player/core/const/app_colors.dart';
import 'package:spoken_core_player/core/images/image_Path.dart';
class SpokenPostView extends StatelessWidget {
  const SpokenPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lesswhiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: custom_Text(Txt: "Spoken Post", Size: 12, weight: FontWeight.w400, color: AppColors.offwhiteColor, theme: true),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Stack(
              children: [
                Container(
                  height: 200.h,
                  width: 1.sw,
                ),
                Positioned(
                  top: 40,
                  child: Container(
                    height: 150.h,
                    width: 300.w,
                    margin: EdgeInsets.symmetric(horizontal: 23),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(10),
                        border: Border.all(width: 2,style: BorderStyle.solid,color: Colors.black38,)
                    ),
                    child: custom_Text(Txt: "What you spend years building may be destroyed overnight.Build anyways",
                        Size: 14, weight: FontWeight.w300, color: AppColors.fontcolor, theme: false),
                  ),
                ),
                Positioned(
                  top: 10.h,
                  left: 1.sh/5,
                  child: CircleAvatar(
                    child: Image.asset(Image_Path.profile_pic),
                    maxRadius: 20,
                  ),
                ),
              ],
            ),
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
                  custom_Text(Txt: "Quotation", Size: 16, weight: FontWeight.w300, color: AppColors.fontcolor, theme: true),

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
                  custom_Text(Txt: "Category", Size: 16, weight: FontWeight.w300, color: AppColors.fontcolor, theme: true),
                  custom_Text(Txt: "Success", Size: 16, weight: FontWeight.w300, color: AppColors.fontcolor, theme: true),

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