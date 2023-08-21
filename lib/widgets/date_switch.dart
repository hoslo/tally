import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/common/time.dart';
import 'package:tally/providers/statistics.dart';
import 'package:intl/intl.dart';
import 'package:tally/themes/light.dart';

class DateSwitch extends ConsumerWidget {
  const DateSwitch({super.key});

  String getFormatDate(WidgetRef ref) {
    DateTime now = ref.watch(timeProvider);
    final String type = ref.watch(statisticTypeProvider);
    if (type == "月统计") {
      now = getMonthEnd(now);
      return DateFormat("yyyy年MM月").format(now);
    } else if (type == "周统计") {
      now = getWeekEnd(now);
      return DateFormat("yyyy年MM月dd日").format(now);
    }
    return DateFormat("yyyy年MM月").format(now);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        width: 382.w,
        height: 48.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24).w,
            color: LightTheme.lightGreyWhite),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  if (ref.read(statisticTypeProvider.notifier).state == "月统计") {
                    ref.read(timeProvider.notifier).state = ref
                        .read(timeProvider)
                        .subtract(const Duration(days: 30));
                  } else {
                    ref.read(timeProvider.notifier).state = ref
                        .read(timeProvider)
                        .subtract(const Duration(days: 7));
                  }
                },
                icon: SvgPicture.asset(
                  "assets/icons/arrow_left.svg",
                  colorFilter: const ColorFilter.mode(
                      LightTheme.lightGray, BlendMode.srcIn),
                )),
            Text(getFormatDate(ref),
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: LightTheme.darkBlack)),
            IconButton(
                onPressed: () {
                  if (ref.read(statisticTypeProvider) == "月统计") {
                    ref.read(timeProvider.notifier).state =
                        ref.read(timeProvider).add(const Duration(days: 30));
                  } else {
                    ref.read(timeProvider.notifier).state =
                        ref.read(timeProvider).add(const Duration(days: 7));
                  }
                },
                icon: SvgPicture.asset(
                  "assets/icons/arrow_right.svg",
                  colorFilter: const ColorFilter.mode(
                      LightTheme.lightGray, BlendMode.srcIn),
                ))
          ],
        ));
  }
}
