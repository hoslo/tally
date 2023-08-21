import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tally/models/bill.dart';
import 'package:tally/sql_helper.dart';

class Statistics extends StatefulWidget {
  final DateTime start;
  final DateTime end;

  const Statistics({super.key, required this.start, required this.end});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List<Bill> bills = [];

  void getBills() async {
    await DatabaseHelper.getBillsByCreatedAt(widget.start, widget.end)
        .then((value) => {
              setState(() {
                bills = value;
              })
            });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBills();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 48.h,
        itemCount: bills.length,
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
                        bills[index].icon,
                        width: 24.w,
                        height: 24.h,
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      Text(
                        bills[index].note,
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xff404040),
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 103.w,
                  ),
                  Text(
                    "-¥ ${bills[index].amount}",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(0xffFF9A9A),
                        fontWeight: FontWeight.w400),
                  ),
                ]),
          );
        });
  }
}
