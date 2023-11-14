import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hero/features/home/screen/banner.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/custom_button.dart';
import '../components/home_list_item.dart';
import '../cubit/home_cubit.dart';

class HomeTab extends StatefulWidget {
   HomeTab({super.key});
   int page = 0;
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
 bool isLoading = true;
  
  @override
  void initState() {

    super.initState();
    context.read<HomeCubit>().getHomeData();
    //context.read<HomeCubit>().carouselController = CarouselController();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    if(state is LoadingHomeDataState){
      isLoading = true;
    }
    else if(state is SuccessGettingHomeData){
      isLoading = false;
    }    else if(state is ErrorGettingHomeDataState){
      isLoading = false;
    }
  },
  builder: (context, state) {
    HomeCubit cubit = context.read<HomeCubit>();
    return Scaffold(

      body: isLoading?
          Center(child: CircularProgressIndicator(color: AppColors.primary,),)
     : Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
              height: 10
            ),
            //welcome user
            Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.person_circle_fill,
                              color: Colors.grey,
                            ),
                            Text(
                              'welcome'.tr() + "${cubit.signUpModel?.data?.name??""}",
                              style: TextStyle(
                                  fontSize: getSize(context) / 24,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.black),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 27,
                            ),
                            Expanded(
                              child: Text(
                                "${cubit.address??""}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: getSize(context) / 24,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.gray),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
           //slider+dots
            BannerWidget(sliderData: cubit.homeModel!.data!.sliders!),
            SizedBox(height: getSize(context)*0.1,),            // new orders     //all
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'new_orders'.tr(),
                  style: TextStyle(
                      fontSize: getSize(context) / 20,
                      fontWeight: FontWeight.normal,
                      color: AppColors.black),
                ),
                InkWell(
                  onTap: () {
                    context.read<HomeCubit>().tabsController.animateTo(10);
                  },
                  child: Text(
                    'all'.tr(),
                    style: TextStyle(
                        fontSize: getSize(context) / 24,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primary),
                  ),
                ),
              ],
            ),

            // list of orders
            SizedBox(
                height: getSize(context) * 1.2,
                child: Container(
                  child: ListView.builder(
                    itemCount: cubit.homeModel?.data?.newTrips?.length??0,
                    itemBuilder: (context, index) {
                      return HomeListItem(trip: cubit.homeModel?.data?.newTrips?[index],);

                    },
                  ),
                ),),

          ],
        ),
      ),

        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: getSize(context) / 10),
          child: CustomButton(
            width: getSize(context) / 3,
            text: 'ask_trip'.tr(),
            color: AppColors.primary,
            onClick: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child:Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: getSize(context) * 0.05,
                          ),
                          Row(

                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: getSize(context) * 0.06,
                              ),
                              Text("choose_trip").tr(),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(ImageAssets.close)),
                              SizedBox(
                                width: getSize(context) * 0.05,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getSize(context) * 0.1,
                          ),
                          CustomButton(
                            text: "request_trip".tr(),
                            color: AppColors.primary,
                            onClick: () {
                              context.read<HomeCubit>().setflag(1);
                              context.read<HomeCubit>().tabsController.animateTo(1);
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            height: getSize(context) * 0.1,
                          ),
                          InkWell(
                            onTap: () {
                              context.read<HomeCubit>().setflag(2);
                              context.read<HomeCubit>().tabsController.animateTo(1);
                              Navigator.pop(context);
                              // context.read<HomeCubit>().setMarkers( Marker(
                              //   markerId: const MarkerId("currentLocation"),
                              //   icon: context.read<HomeCubit>().currentLocationIcon,
                              //
                              //   position: LatLng(context.read<HomeCubit>().currentLocation?.latitude??0,
                              //       context.read<HomeCubit>().currentLocation?.longitude??0),
                              // ), null);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: getSize(context)*0.15,vertical: 2),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 2,color: AppColors.primary),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text("ride_without_destination".tr(), style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: AppColors.primary,
                                  fontSize: getSize(context) / 20,
                                  fontWeight: FontWeight.w400),
                              ),),
                          ),

                          // CustomButton(
                          //   text: "ride_without_destination".tr(),
                          //   textcolor: AppColors.primary,
                          //   color: AppColors.white,
                          //   onClick: () {},
                          // ),
                          SizedBox(
                            height: getSize(context) * 0.1,
                          ),
                        ],
                      ),


                    ),
                  );
                },
              );
            },
          ),
        ),


    );
  },
);
  }
}
