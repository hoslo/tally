import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/common/time.dart';
import 'package:tally/models/bill.dart';
import 'package:tally/providers/statistics.dart';
import 'package:tally/sql_helper.dart';
import 'package:tally/themes/light.dart';
import 'package:tally/widgets/item.dart';

final totalExpendProvide = StateProvider<double>((ref) => 0.0);

// ignore: must_be_immutable
class Statistics extends ConsumerWidget {
  late Future<List<Bill>> bills;

  Statistics({super.key});

  void getBills(start, end) async {
    bills = DatabaseHelper.getBillsByCreatedAt(start, end);
  }

  void updateTotol(List<Bill> bills, WidgetRef ref) {
    ref.read(totalExpendProvide.notifier).state =
        bills.map((e) => e.amount).reduce((value, element) => value += element);
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
            if (data.isNotEmpty) {
              Future.delayed(Duration.zero, () {
                updateTotol(data, ref);
              });
            }
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Item(data[index]);
                });
          }
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        });
  }
}
