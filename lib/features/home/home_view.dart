
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spoken_core_player/core/common_widgets/Custom_Text.dart';
import 'package:spoken_core_player/core/const/Padding.dart';
import 'package:spoken_core_player/core/const/app_colors.dart';
import 'package:spoken_core_player/core/const/dynamic.dart';
import 'package:spoken_core_player/core/const/fix_height_width.dart';
import 'package:spoken_core_player/core/images/image_Path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spoken_core_player/core/utils/routes/routes_name.dart';
import 'package:spoken_core_player/features/videoScreen/video_view.dart';

import '../../core/const/status.dart';



class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();

}

class _HomeViewState extends State<HomeView> {
  final _pageControler = PageController(viewportFraction: 0.85);
  double _opacity = 0.1;
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(onPressed:(){}, icon:Icon(Icons.arrow_back_ios_new),
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              constraints: BoxConstraints(),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 80.w ,
                            ),
                            IconButton(onPressed: (){ Navigator.pushNamed(context,RoutesName.Creator);},
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
                              custom_Text(Txt: "QUOTE", Size: 30, weight: FontWeight.bold,color: AppColors.offwhiteColor, theme: false),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: Pading.Padding15),
                                child: custom_Text(Txt: Quote[ind],
                                    Size: 18 , weight: FontWeight.w300, color: AppColors.offwhiteColor,theme: true),
                              )

                            ],),
                          ),
                        ),
                        Positioned(
                          bottom: 140.h,
                          right: 10.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(onPressed:(){}, icon:Icon(Icons.ios_share,size: 25,color: AppColors.offwhiteColor,),
                                padding: EdgeInsets.fromLTRB(20.w, 0,5.w,0),
                                constraints: BoxConstraints(),
                              ),
                              IconButton(onPressed:(){}, icon:Icon(Icons.messenger_outline,size:25,color: AppColors.offwhiteColor),
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
                                padding: EdgeInsets.fromLTRB(10.w, 10.h,5.w,0),
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
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.r),
                                  child: CircleAvatar(
                                    child: Image.asset(UsersPic[index]),
                                    maxRadius: 15.r,

                                  ),
                                ),
                                custom_Text(Txt:Users[index], Size:12.sp, weight:FontWeight.w300, color:AppColors.whiteColor, theme: true),
                              ],
                            )),
                        Positioned(
                            bottom: 10.h,
                            right: 10.w,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => VideoView(index: ind)),
                                );
                                // Navigator.pushNamed(context,RoutesName.videoplayer);

                              },
                              child: Container(

                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    borderRadius: BorderRadius.circular(10.r)
                                ),

                                height: 40.h,
                                width: 40.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.play_arrow_outlined,size: 30.sp,color: AppColors.darkgryColor,)


                                  ],
                                ),
                              ),
                            )),


                      ],


                    );
                  }),
            );
          })
    );
  }
}
