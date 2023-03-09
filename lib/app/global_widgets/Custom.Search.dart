import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:demo/app/core/values/color.dart';
import 'package:demo/app/global_widgets/Custom.Text.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 1.2.h),
      decoration: BoxDecoration(
        color: CustomColor.white,
        borderRadius: BorderRadius.circular(5.h),
        boxShadow: [
          BoxShadow(
            color: CustomColor.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2.w, right: 1.w),
            child: const Icon(Icons.search),
          ),
          const CustomText(
              title: 'Tìm kiếm', color: CustomColor.black, style: '10'),
        ],
      ),
    );
  }
}
