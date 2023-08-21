import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/providers/statistics.dart';
import 'package:tally/widgets/statistics.dart';

import '../widgets/date_switch.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  DateTime get startMonth => DateTime.now().subtract(const Duration(days: 30));
  DateTime get week => DateTime.now().subtract(const Duration(days: 7));
  DateTime get end => DateTime.now();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String type = ref.watch(statisticTypeProvider);

    print('tttt: $type');
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
              border: Border.all(color: const Color(0xffD9D9D9)),
              borderRadius: BorderRadius.circular(8).w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(
                  '总支出',
                  style: TextStyle(
                    color: const Color(0xffA6A6A6),
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 15.w),
                child: Text(
                  '¥ 0.00',
                  style: TextStyle(
                    color: const Color(0xff5986F2),
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
          color: const Color(0xffD9D9D9),
        ),
        Expanded(
          child: type == "周统计"
              ? Statistics(
                  start: week,
                  end: end,
                )
              : Statistics(
                  start: startMonth,
                  end: end,
                ),
        )
      ],
    );
  }
}
