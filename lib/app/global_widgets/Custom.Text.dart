import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomText extends StatelessWidget {
  final String title;
  final Color color;
  final String style;

  const CustomText(
      {super.key,
      required this.title,
      required this.color,
      required this.style});

  TextStyle renderStyle() {
    switch (style) {
      case '5':
        return TextStyle(
          color: color,
          fontSize: 5.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',
        );
      case '8':
        return TextStyle(
          color: color,
          fontSize: 8.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
        );
      case '8b':
        return TextStyle(
          color: color,
          fontSize: 8.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Roboto',
        );
      case '9':
        return TextStyle(
          color: color,
          fontSize: 9.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',
        );
      case '9b':
        return TextStyle(
          color: color,
          fontSize: 9.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Roboto',
        );
      case '10':
        return TextStyle(
          color: color,
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',
        );
      case '10b':
        return TextStyle(
          color: color,
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Roboto',
        );
      case '11':
        return TextStyle(
          color: color,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',
        );
      case '11b':
        return TextStyle(
          color: color,
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Roboto',
        );
      case '12':
        return TextStyle(
          color: color,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',
        );
      case '12b':
        return TextStyle(
          color: color,
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Roboto',
        );
      case '13':
        return TextStyle(
          color: color,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',
        );
      case '13b':
        return TextStyle(
          color: color,
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Roboto',
        );
      default:
        return TextStyle(
          color: color,
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: renderStyle(),
    );
  }
}
