import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hero/core/utils/app_colors.dart';
import 'package:hero/core/utils/getsize.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../cubit/home_driver_cubit.dart';

class HomeMapDriver extends StatefulWidget {
  const HomeMapDriver({super.key});

  @override
  State<HomeMapDriver> createState() => _HomeMapDriverState();
}

class _HomeMapDriverState extends State<HomeMapDriver> {
  HomeDriverCubit? cubit;

  @override
  Widget build(BuildContext context) {
    cubit = context.read<HomeDriverCubit>();

    return BlocBuilder<HomeDriverCubit, HomeDriverState>(
      builder: (context, state) {

        return Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              Builder(
                builder: (context) {
                  return GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        cubit!.currentLocation != null ? cubit!.currentLocation!
                            .latitude! : 0,
                        cubit!.currentLocation != null ? cubit!.currentLocation!
                            .longitude! : 0,
                      ),
                      zoom: 13.5,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId("currentLocation"),
                        icon: cubit!.markerIcon != null
                            ? BitmapDescriptor.fromBytes(cubit!.markerIcon!)
                            : cubit!.currentLocationIcon,
                        position: LatLng(
                          cubit!.currentLocation != null ? cubit!
                              .currentLocation!.latitude! : 0,
                          cubit!.currentLocation != null ? cubit!
                              .currentLocation!.longitude! : 0,
                        ),
                      ),
                      // Rest of the markers...
                    },
                    onMapCreated: (GoogleMapController controller) {
                      cubit!.mapController =
                          controller; // Store the GoogleMapController
                    },
                    onTap: (argument) {
                      // _customInfoWindowController.hideInfoWindow!();
                    },
                    onCameraMove: (position) {
                      if (cubit!.strartlocation!=position.target){
                        print(cubit!.strartlocation);
                        cubit!.strartlocation=position.target;
                        cubit!.getCurrentLocation();}
                      // _customInfoWindowController.hideInfoWindow!();
                    },


                  );
                },


              ),
              Positioned(
                  top: 20,
                  width: getSize(context) / 2.5,
                  child: Material(
                    borderRadius: BorderRadius.all(
                        Radius.circular(getSize(context) / 20)),
                    color: AppColors.white,
                    child: Center(
                      child: SizedBox(
                        width: getSize(context) / 2.5,
                        height: 39,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.circle_fill,
                              size: 10,
                              color: cubit!.inService
                                  ? AppColors.success
                                  : AppColors.gray2,
                            ),
                            Text(
                              cubit!.inService
                                  ? "you_conect".tr()
                                  : "you_not_conect".tr(),
                              style: TextStyle(
                                fontSize: getSize(context) / 24,
                                color: cubit!.inService
                                    ? AppColors.success
                                    : AppColors.gray2,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              Positioned(
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: LiteRollingSwitch(
                    value: true,
                    width: 150,
                    textOn: 'in_service'.tr(),
                    textOff: 'out_service'.tr(),
                    textOffColor: AppColors.white,
                    textOnColor: AppColors.white,
                    colorOn: AppColors.success,
                    colorOff: AppColors.grey2,
                    iconOff: Icons.power_settings_new,
                    animationDuration: const Duration(milliseconds: 300),
                    onChanged: (bool state) {
                      cubit!.switchInservice(state);
                    },
                    onDoubleTap: () {},
                    onSwipe: () {},
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: getSize(context) / 7.5),
            child: CustomButton(
              width: getSize(context) / 3,
              text: 'immediate_trip'.tr(),
              color: AppColors.primary,
              onClick: () {
                context.read<HomeDriverCubit>().tabsController!.index=1;
              },
            ),
          ),
        );
      },
    );
  }


}
