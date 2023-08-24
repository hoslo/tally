import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/common/time.dart';
import 'package:tally/providers/statistics.dart';
import 'package:tally/themes/light.dart';
import 'package:tally/widgets/statistics.dart';

import '../widgets/date_switch.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        Container(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: const DateSwitch()),
        SizedBox(
          height: 24.w,
        ),
        Container(
          width: 382.w,
          height: 48.h,
          decoration: BoxDecoration(
              border: Border.all(color: LightTheme.silverMist),
              borderRadius: BorderRadius.circular(8).w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(
                  '总支出',
                  style: TextStyle(
                    color: LightTheme.lightGray,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 15.w),
                child: Text(
                  '¥ ${ref.watch(totalExpendProvide)}',
                  style: TextStyle(
                    color: LightTheme.lightBlue,
                    fontSize: 16.sp,
                  ),
                ),
              )
            ],
          ),
        ),
        Divider(
          height: 48.h,
          thickness: 1.w,
          color: LightTheme.silverMist,
        ),
        Expanded(child: Statistics())
      ],
    );
  }
}
