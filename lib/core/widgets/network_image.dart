import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ManageNetworkImage extends StatelessWidget {
  const ManageNetworkImage(
      {Key? key,
      required this.imageUrl,
      this.height = 0,
      this.width = 0,
        this.boxFit=BoxFit.cover,
      this.borderRadius = 12})
      : super(key: key);

  final String imageUrl;
  final double height;
  final double width;
  final double borderRadius;
 final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit:boxFit ,
      height: height != 0 ? height : null,
      width: width != 0 ? width : null,

      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
      errorWidget: (context, url, error) {
        return Image.asset("assets/images/logo.png",color: AppColors.primary,);
      },
    );
  }
}

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage(
      {Key? key,
        required this.imageUrl,
        this.height = 0,
        this.width = 0,
        this.boxFit = BoxFit.cover,
        this.borderRadius = 12,
        this.errorWidget})
      : super(key: key);

  final String imageUrl;
  final double height;
  final double width;
  final double borderRadius;
  final BoxFit? boxFit;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: boxFit,
        height: height != 0 ? height : null,
        width: width != 0 ? width : null,
        placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
        errorWidget: (context, url, error) =>
        errorWidget!
      ),
    );
  }
}
