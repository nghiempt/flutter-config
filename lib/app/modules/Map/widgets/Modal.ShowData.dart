import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:demo/app/core/values/color.dart';
import 'package:demo/app/global_widgets/Custom.Text.dart';

class ModalShowData extends StatelessWidget {
  final List dataLayer;
  const ModalShowData({super.key, required this.dataLayer});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Column(
              children: [
                Container(
                  height: 0.5.h,
                  width: 10.w,
                  margin: EdgeInsets.only(bottom: 1.h),
                  decoration: BoxDecoration(
                    color: CustomColor.black,
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                ),
                const CustomText(
                  title: 'Thông tin quy hoạch',
                  color: CustomColor.black,
                  style: '12b',
                ),
              ],
            ),
          ),
          dataLayer.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataLayer.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      padding: EdgeInsets.all(1.h),
                      decoration: BoxDecoration(
                        color: CustomColor.white,
                        borderRadius: BorderRadius.circular(1.h),
                        boxShadow: [
                          BoxShadow(
                            color: CustomColor.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: dataLayer[index].length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: 30.w,
                                      child: Text(
                                          '${dataLayer[index].keys.toList()[i]}:'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(dataLayer[index]
                                        .values
                                        .toList()[i]
                                        .toString()),
                                  )
                                ],
                              ),
                              const Divider(
                                color: CustomColor.grey,
                                thickness: 0.3,
                              )
                            ],
                          );
                        },
                      ),
                    );
                  },
                )
              : const Center(
                  child: CustomText(
                    title: 'Không có thông tin',
                    color: CustomColor.black,
                    style: '8',
                  ),
                )
        ],
      ),
    );
  }
}
