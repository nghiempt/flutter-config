import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:demo/app/core/values/color.dart';
import 'package:demo/app/modules/Dashboard/widgets/Card.Post.Widget.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class SnappingModal extends StatelessWidget {
  final List listMapFilter;
  final SnappingSheetController snappingSheetController;
  const SnappingModal(
      {super.key,
      required this.snappingSheetController,
      required this.listMapFilter});

  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      controller: snappingSheetController,
      snappingPositions: const [
        SnappingPosition.factor(
          positionFactor: 0.7,
          snappingCurve: Curves.easeOutQuint,
          snappingDuration: Duration(milliseconds: 350),
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(
          snappingCurve: Curves.easeOutQuint,
          snappingDuration: Duration(milliseconds: 350),
          positionFactor: 0.15,
        ),
      ],
      grabbing: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(2.h),
          ),
          border: Border.all(
            width: 0,
            color: Theme.of(context).colorScheme.surface,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 25,
              color: CustomColor.black.withOpacity(0.2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 10.w,
              height: 0.4.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.shadow,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      ),
      grabbingHeight: 3.h,
      sheetAbove: null,
      sheetBelow: SnappingSheetContent(
        sizeBehavior: SheetSizeStatic(size: 300),
        draggable: true,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(
              width: 0,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listMapFilter.length,
            itemBuilder: (BuildContext context, int index) {
              Map map = listMapFilter[index];
              return CardPost(map: map);
            },
          ),
        ),
      ),
      lockOverflowDrag: true,
    );
  }
}
