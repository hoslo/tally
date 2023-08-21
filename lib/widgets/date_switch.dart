import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DateSwitch extends StatelessWidget {
  const DateSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 382.w,
        height: 48.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24).w,
            color: const Color(0xfff5f5f5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/arrow_left.svg")),
            Text('2021年6月',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff333333))),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/arrow_right.svg"))
          ],
        ));
  }
}
