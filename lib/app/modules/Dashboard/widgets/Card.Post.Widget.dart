import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sizer/sizer.dart';
import 'package:demo/app/core/utils/api.dart';
import 'package:demo/app/core/values/color.dart';
import 'package:demo/app/global_widgets/Custom.Text.dart';

class CardPost extends StatelessWidget {
  const CardPost({super.key, required this.map});

  final Map map;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 3.w,
        vertical: 1.h,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 1.h,
      ),
      decoration: BoxDecoration(
        color: CustomColor.white,
        borderRadius: BorderRadius.circular(1.h),
        boxShadow: [
          BoxShadow(
            color: CustomColor.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          ListTile(
            onTap: () => Get.toNamed('/map', arguments: map),
            leading: GFImageOverlay(
              height: 10.h,
              width: 7.h,
              colorFilter: ColorFilter.mode(
                CustomColor.black.withOpacity(1),
                BlendMode.dstATop,
              ),
              image:
                  NetworkImage('${ApiUrl.baseUrl}/file_image/${map['Image']}'),
            ),
            title: CustomText(
              title: map['Title'],
              color: CustomColor.black,
              style: '9b',
            ),
            subtitle: CustomText(
              title: 'Lượt xem: ${map['TotalView'].toString()}',
              color: CustomColor.black,
              style: '8',
            ),
          ),
          Positioned(
            left: 2.w,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(0.3.h),
              decoration: BoxDecoration(
                color: CustomColor.error,
                borderRadius: BorderRadius.circular(0.3.h),
              ),
              child: const CustomText(
                title: '100 km',
                color: CustomColor.white,
                style: '5',
              ),
            ),
          )
        ],
      ),
    );
  }
}
