import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spoken_core_player/core/common_widgets/Custom_Text.dart';
import 'package:spoken_core_player/core/const/app_colors.dart';
import 'package:spoken_core_player/core/images/image_Path.dart';

import '../../core/utils/routes/routes_name.dart';
class SubjectView extends StatelessWidget {
  const SubjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lesswhiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: custom_Text(Txt: "Subject", Size: 12, weight: FontWeight.w400, color: AppColors.offwhiteColor, theme: true),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             custom_Text(Txt: "Quote", Size: 35, weight: FontWeight.w500, color: AppColors.fontcolor, theme: true),
            InkWell(
              onTap: (){ Navigator.pushNamed(context,RoutesName.SpokenPost);},
              child: Container(
                height: 150.h,
                width: 300.w,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                border: Border.all(width: 2,style: BorderStyle.solid,color: Colors.black38,)
              ),
                child: Center(
                  child: custom_Text(Txt: "What you spend years building may be destroyed overnight.Build anyways",
                      Size: 14, weight: FontWeight.w300, color: AppColors.fontcolor, theme: false),
                ),
              ),
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