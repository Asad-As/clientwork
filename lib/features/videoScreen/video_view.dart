import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spoken_core_player/core/const/dynamic.dart';
import 'package:video_player/video_player.dart';

import '../../core/common_widgets/Custom_Text.dart';
import '../../core/const/Padding.dart';
import '../../core/const/app_colors.dart';
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

  loadVideoPlayer(){
    controller = VideoPlayerController.network(VideoUrl[widget.index]);
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
          Image.asset(
            Image_Path.blackscreen,
            fit: BoxFit.fitHeight,
            height: 1.sh,
            width: 1.sw,
          ),
          Positioned(
            top: 0,
            child: SizedBox(
              height: 1.sh/1.5,
              width: 1.sw,
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio:3/3.3,
                    child: VideoPlayer(controller),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top:1.sh/1.89),
                    child: VideoProgressIndicator(
                        controller,
                        allowScrubbing: true,
                        colors:VideoProgressColors(
                          playedColor: Colors.black54,
                          bufferedColor:  Colors.grey,
                        )

                      ),
                  ),

                  Positioned(
                    top: 1.sh/2.4,
                   // right: 1.sh/2,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: (){
                              if(controller.value.isPlaying){
                                controller.pause();
                              }else{
                                controller.play();
                              }

                              setState(() {

                              });
                            },
                            icon:Icon(controller.value.isPlaying?Icons.pause:Icons.play_arrow)
                        ),
                      ],
                    ),
                  )

                ],),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed:(){
                Navigator.pop(context);
              }, icon:Icon(Icons.arrow_back_ios_new),
                padding: EdgeInsets.symmetric(vertical: 20.h),
                constraints: BoxConstraints(),
              ),
              IconButton(onPressed: (){ Navigator.pushNamed(context,RoutesName.Creator);},
                icon: Image.asset(Image_Path.logo),
              )
            ],
          ),

          Positioned(
            top: 1.sh/1.85,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        BgPic[widget.index]
                    ),
                    fit: BoxFit.cover
                )),
              height: 1.sh/2,
              width: 1.sh/2,
               child:BlurryContainer(
                 child: Container(
                   color: Colors.black.withOpacity(_opacity),
                   child: Column(children: [
                     custom_Text(Txt: "QUOTE", Size: 30.sp, weight: FontWeight.bold,color: AppColors.offwhiteColor, theme: false),
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
                 blur: 5,
                 width:1.sh,
                 height: 1.sh/2,
                 color: Colors.transparent,
               ),),),
          Positioned(
            bottom: 140.h,
            right: 10.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(onPressed:(){}, icon:Icon(Icons.ios_share,size: 25.sp,color: AppColors.offwhiteColor,),
                  padding: EdgeInsets.fromLTRB(20.w, 0,5.w,0),
                  constraints: BoxConstraints(),
                ),
                IconButton(onPressed:(){}, icon:Icon(Icons.messenger_outline,size:25.sp,color: AppColors.offwhiteColor),
                  padding:EdgeInsets.fromLTRB(10.w, 20.h,5.w,0),
                  constraints: BoxConstraints(),
                ),
                custom_Text(Txt: "1.2k  ", Size: 13.sp, weight: FontWeight.w300, color: AppColors.offwhiteColor, theme: true),
                IconButton(onPressed:(){
                  setState(() {

                    like_status= !like_status;
                    if(like_status == true)
                    { number= number-1; }
                    else{
                      number = number+1;
                    }
                  });
                }, icon:ImageIcon(  like_status?AssetImage(Image_Path.like):AssetImage(Image_Path.liked) ,size: 30.sp,color: AppColors.offwhiteColor),
                  padding: EdgeInsets.fromLTRB(10.w, 10.h,5.w,0.h),
                  constraints: BoxConstraints(),
                ),
                custom_Text(Txt: number.toString()+"k", Size: 13.sp, weight: FontWeight.w300, color: AppColors.offwhiteColor, theme: true),

              ],
            ),
          ),
          Positioned(
              bottom: 10.h,
              left: 5.w,
              child: Row(
                children: [
                  CircleAvatar(
                    child: Image.asset(Image_Path.profile_pic),
                    maxRadius: 15.r,

                  ),
                  custom_Text(Txt:"@namehere", Size:12.sp, weight:FontWeight.w300, color:AppColors.whiteColor, theme: true),
                ],
              )),
          Positioned(
              bottom: 10.h,
              right: 10.w,
              child: InkWell(
                onTap: (){

                 Navigator.pop(context);

                },
                child: Container(

                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10.r)
                  ),

                  height: 40.h,
                  width: 40.w,
                  child: ImageIcon( AssetImage(Image_Path.sound),size: 30.sp,color: AppColors.darkgryColor,),
                ),
              )),


        ],


      ),
    );
  }
}