import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/models/bill.dart';
import 'package:tally/themes/light.dart';

final itemStatusProvider = StateProvider<bool>((ref) => false);

class Item extends ConsumerWidget {
  final Bill bill;

  const Item(this.bill, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(itemStatusProvider);
    return InkWell(
      onLongPress: () {
        ref.read(itemStatusProvider.notifier).state = !status;
      },
      child: Container(
        padding:
            EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h, bottom: 12.h),
        height: 48.h,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              SvgPicture.asset(
                bill.icon,
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                    LightTheme.charcoalGrey, BlendMode.srcIn),
              ),
              SizedBox(
                width: 11.w,
              ),
              Text(
                bill.note,
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
            "-¥ ${bill.amount}",
            style: TextStyle(
                fontSize: 16.sp,
                color: LightTheme.roseBlush,
                fontWeight: FontWeight.w400),
          ),
        ]),
      ),
    );
  }
}
