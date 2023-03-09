import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:getwidget/getwidget.dart';
import 'package:demo/app/core/values/color.dart';

class CategoryWidget extends StatelessWidget {
  final List categorys;

  const CategoryWidget({super.key, required this.categorys});

  Icon renderIcon(String name) {
    switch (name) {
      case 'Nông Nghiệp':
        return const Icon(Icons.agriculture);
      case 'Lâm Nghiệp':
        return const Icon(Icons.forest);
      case 'Giao thông vận tải':
        return const Icon(Icons.traffic);
      case 'Tài nguyên thiên nhiên':
        return const Icon(Icons.nature);
      case 'Xây dựng':
        return const Icon(Icons.build_circle);
      case 'Thảm thực vật':
        return const Icon(Icons.grass);
      default:
        return const Icon(Icons.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categorys
            .map(
              (category) => Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: GFButton(
                  onPressed: () {},
                  text: category['Name'],
                  icon: renderIcon(category['Name']),
                  shape: GFButtonShape.pills,
                  color: CustomColor.white,
                  textStyle: TextStyle(
                    color: CustomColor.black,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
