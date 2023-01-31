
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spoken_core_player/core/common_widgets/Custom_Text.dart';
import 'package:spoken_core_player/core/const/Padding.dart';
import 'package:spoken_core_player/core/const/app_colors.dart';
import 'package:spoken_core_player/core/const/dynamic.dart';
import 'package:spoken_core_player/core/images/image_Path.dart';
import 'package:spoken_core_player/core/utils/routes/routes_name.dart';
import 'package:spoken_core_player/features/videoScreen/video_view.dart';

import '../../core/const/fix_height_width.dart';
import '../../core/const/status.dart';
import '../../core/utils/Animation/pageanimation.dart';
import '../creator/creator_view.dart';



class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();

}

class _HomeViewState extends State<HomeView> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: PageScrollPhysics(),
          itemCount: Users.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 1.sh,
              width: 1.sw,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: PageScrollPhysics(),
                  itemCount:  VideoUrl.length,
                  itemBuilder: (BuildContext context, int ind) {
                    return Stack(
                      children: [
                        Image.asset(
                          BgPic[ind],
                          fit: BoxFit.fitHeight,
                          height: 1.sh,
                          width: 1.sw,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                          /* IconButton(onPressed:(){}, icon:Icon(Icons.arrow_back_ios_new),
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              constraints: BoxConstraints(),
                            ),*/
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 80.w ,
                            ),
                            IconButton(onPressed: (){ Navigator.pushNamed(context,RoutesName.controller);},
                              icon: Image.asset(Image_Path.logo),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 1.sh/3,
                          child: Container(
                            height: 1.sh/2,
                            width: 1.sw,
                            child: Column(children: [
                                Hero(
                                  tag: UniqueKey(),
                                  child: SvgPicture.asset(
                                  Image_Path.watermark, height: 50.h,width: 50.w,color: AppColors.offwhiteColor.withOpacity(0.6)
                            ),
                                ),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: Pading.Padding15),
                                child: custom_Text(Txt: Quote[ind],
                                    Size: 18 , weight: FontWeight.w500, color: AppColors.offwhiteColor,theme: true),
                              )

                            ],),
                          ),
                        ),
                        Positioned(
                            bottom: 25.h,
                            left: 15.w,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return CreatorView();
                                        });},
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.r),
                                    child: CircleAvatar(
                                      child: Image.asset(UsersPic[index]),
                                      maxRadius: 20.r,

                                    ),
                                  ),
                                ),
                                FixHeightWidth.width5,
                                custom_Text(Txt:Users[index], Size:15.sp, weight:FontWeight.w300, color:AppColors.whiteColor, theme: true),
                              ],
                            )),
                        Positioned(
                            bottom: 15.h,
                            right: 15.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end ,
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
                                    },
                                        alignment: Alignment(0,4.h),
                                        icon:SvgPicture.asset(
                                        Image_Path.like, height: 32.h,width: 30.w,color: like_status? AppColors.offwhiteColor:Colors.redAccent
                                    ) ),
                                    custom_Text(Txt: number.toString()+"k", Size: 12, weight: FontWeight.w100, color: AppColors.offwhiteColor, theme: false),

                                  ],
                                ),



                               FixHeightWidth.width10,
                                InkWell(
                                  onTap: (){

                                    Navigator.push(
                                      context,
                                        SizeRoute(page: VideoView(index: ind,))
                                    );
                                  },
                                  child:Padding(
                                    padding: EdgeInsets.only(top: 12.h),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white38,
                                          borderRadius: BorderRadius.circular(10.r)
                                      ),
                                      height: 40.h,
                                      width: 40.w,
                                      child:IconButton(
                                        onPressed:(){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  VideoView(index: ind))
                                        );
                                      },
                                        alignment: Alignment(0,3.h),
                                        icon: SvgPicture.asset(
                                            Image_Path.video, height: 32.h,width: 30.w,color: AppColors.offwhiteColor  ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],


                    );
                  }),
            );
          })
    );
  }
}
