import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/models/bill.dart';
import 'package:tally/providers/bill.dart';
import 'package:tally/sql_helper.dart';

class Submit extends ConsumerStatefulWidget {
  const Submit({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SubmitState();
}

class _SubmitState extends ConsumerState<Submit> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final amount = ref.read(billProvider).amount;
        final note = ref.read(billProvider).note;
        final icon = ref.read(billProvider).icon;

        DatabaseHelper.createBill(Bill(amount: amount, note: note, icon: icon));
      },
      child: Container(
        width: 382.w,
        height: 48.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24).w,
            color: ref.watch(billProvider).icon != ""
                    ? const Color(0xff5986F2)
                    : const Color(0xffD9D9D9)),
        child: Center(
          child: Text("提交",
              style: TextStyle(
                color: (ref.watch(billProvider).icon != "" && ref.watch(billProvider).note != "" && ref.watch(billProvider).amount != 0)
                    ? const Color(0xffFCFCFC)
                    : const Color(0xffA6A6A6),
                fontSize: 16.w,
              )),
        ),
      ),
    );
  }
}
