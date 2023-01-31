import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spoken_core_player/core/const/dynamic.dart';
import 'package:spoken_core_player/features/creator/creator_view.dart';
import 'package:video_player/video_player.dart';

import '../../core/common_widgets/Custom_Text.dart';
import '../../core/const/Padding.dart';
import '../../core/const/app_colors.dart';
import '../../core/const/fix_height_width.dart';
import '../../core/const/status.dart';
import '../../core/images/image_Path.dart';
import '../../core/utils/routes/routes_name.dart';

/// Stateful widget to fetch and then display video content.

class VideoView extends StatefulWidget{
   int index;

   VideoView ({Key? key, required this.index}):super(key:key);
  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {

  late VideoPlayerController controller;

  double _opacity = 0.1; // from 0-1.0



  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }
  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  loadVideoPlayer(){
    //controller = VideoPlayerController.network(VideoUrl[widget.index]);
     //controller = VideoPlayerController.asset(Videoassets[widget.index]);
     controller = VideoPlayerController.asset('Assets/Untitled.mp4');

    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value){
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body:Stack(

        children: [
       SizedBox(
         height: 1.sh,
         width: 1.sw,
         child: Image.asset(BgPic[widget.index] ,fit: BoxFit.cover,),
       ),
          Positioned(
            top: 0,
            child: SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Stack(
                children: [
                  InkWell(
                      onTap: (){
                        if(controller.value.isPlaying){
                          controller.pause();
                        }else{
                          controller.play();
                        }
                        setState(() {
                        });

                      },
                      child: VideoPlayer(controller)),

                ],),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed:(){
                Navigator.pop(context);
              }, icon:Icon(Icons.arrow_back_ios_new,color: AppColors.offwhiteColor,),
                padding: EdgeInsets.symmetric(vertical: 20.h),
                constraints: BoxConstraints(),
              ),
              IconButton(onPressed: (){
                controller.pause();
                Navigator.pushNamed(context,RoutesName.controller);},
                icon: Image.asset(Image_Path.logo),
              )
            ],
          ),
          // this wedgit is the card
          Positioned(
            top: 1.sh/1.6,
            left: 20.w,
            right: 20.w,
            child:
            BlurryContainer(
              elevation: 5.0,
              blur: 3,
              color: Colors.white24,
              child: Container(
                height: 1.sh/4.5,
                width: 1.sw/1.2,
                child: Column(
                  children: [
                  Hero(
                    tag:UniqueKey(),
                    child: SvgPicture.asset(
                        Image_Path.watermark, height: 50.h,width: 50.w,color: AppColors.offwhiteColor.withOpacity(0.6)

                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: Pading.Padding15),
                    child: SizedBox(
                      width: 1.sw/1.2,
                      child: custom_Text(Txt: Quote[widget.index],
                          Size: 18.sp , weight: FontWeight.w300, color: AppColors.offwhiteColor,theme: true),
                    ),
                  )

                ],
                ),
              ),

            ),

          ),

          Positioned(
              bottom: 25.h,
              left: 15.w,
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      controller.pause();
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CreatorView();
                          });},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: CircleAvatar(
                        child: Image.asset(UsersPic[widget.index]),
                        maxRadius: 20.r,

                      ),
                    ),
                  ),
                  FixHeightWidth.width5,
                  custom_Text(Txt:Users[widget.index], Size:15.sp, weight:FontWeight.w300, color:AppColors.whiteColor, theme: true),
                ],
              )),
          Positioned(
              bottom: 15.h,
              right: 15.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end
                ,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton( onPressed:(){},
                        alignment: Alignment(0,3),
                        icon: SvgPicture.asset(
                            Image_Path.message, height: 30.h,width: 30.w,color: AppColors.offwhiteColor  ),
                      ),
                      custom_Text(Txt: "12k", Size: 12, weight: FontWeight.w200, color: AppColors.offwhiteColor, theme: false),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(onPressed:(){
                        setState(() {


                          like_status= !like_status;
                          if(like_status == true)
                          { number= number-1; }
                          else{
                            number = number+1;
                          }

                        });
                      }, alignment: Alignment(0,4.h),
                          icon:SvgPicture.asset(
                          Image_Path.like, height: 32.h,width: 30.w,color: like_status? AppColors.offwhiteColor:Colors.redAccent
                      )),   custom_Text(Txt: number.toString()+"k", Size: 12, weight: FontWeight.w200, color: AppColors.offwhiteColor, theme: false),

                    ],
                  ),
                  FixHeightWidth.width10,
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(10.r)
                      ),
                      height: 40.h,
                      width: 40.w,
                      child:IconButton( onPressed:(){
                      Navigator.pop(context);
                      },
                        alignment: Alignment(0,3.h),
                        icon: SvgPicture.asset(
                            Image_Path.sound, height: 32.h,width: 30.w,color: AppColors.offwhiteColor  ),
                      ),
                    ),
                  ),
                ],
              )),


        ],


      ),
    );
  }
}
