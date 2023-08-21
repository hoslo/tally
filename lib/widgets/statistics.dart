import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/common/time.dart';
import 'package:tally/models/bill.dart';
import 'package:tally/providers/statistics.dart';
import 'package:tally/sql_helper.dart';
import 'package:tally/themes/light.dart';

// ignore: must_be_immutable
class Statistics extends ConsumerWidget {
  late Future<List<Bill>> bills;

  Statistics({super.key});

  void getBills(start, end) async {
    bills = DatabaseHelper.getBillsByCreatedAt(start, end);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String type = ref.watch(statisticTypeProvider);
    final DateTime now = ref.watch(timeProvider);
    if (type == "月统计") {
      final start = getMonthStart(now);
      final end = getMonthEnd(now);
      getBills(start, end);
    } else if (type == "周统计") {
      final start = getWeekStart(now);
      final end = getWeekEnd(now);
      getBills(start, end);
    }
    return FutureBuilder<List<Bill>>(
        future: bills,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 16.w, right: 16.w, top: 12.h, bottom: 12.h),
                    height: 48.h,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                data[index].icon,
                                width: 24.w,
                                height: 24.h,
                                colorFilter: const ColorFilter.mode(LightTheme.charcoalGrey, BlendMode.srcIn),
                              ),
                              SizedBox(
                                width: 11.w,
                              ),
                              Text(
                                data[index].note,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: LightTheme.charcoalGrey,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 103.w,
                          ),
                          Text(
                            "-¥ ${data[index].amount}",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: LightTheme.roseBlush,
                                fontWeight: FontWeight.w400),
                          ),
                        ]),
                  );
                });
          }
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        });
  }
}
