import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/models/bill.dart';
import 'package:tally/providers/bill.dart';
import 'package:tally/sql_helper.dart';
import 'package:tally/themes/light.dart';
import 'package:tally/widgets/catagory.dart';
import 'package:tally/widgets/input/note.dart';
import 'package:tally/widgets/input/price.dart';

class Submit extends ConsumerStatefulWidget {
  const Submit({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SubmitState();
}

class _SubmitState extends ConsumerState<Submit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.w,
      height: 48.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24).w,
          color: (ref.watch(billProvider).icon != "" &&
                  ref.watch(billProvider).note != "" &&
                  ref.watch(billProvider).amount != 0)
              ? LightTheme.lightBlue
              : LightTheme.silverMist),
      child: TextButton(
          onPressed: (ref.watch(billProvider).icon != "" &&
                  ref.watch(billProvider).note != "" &&
                  ref.watch(billProvider).amount != 0) ? () async {
            final amount = ref.read(billProvider).amount;
            final note = ref.read(billProvider).note;
            final icon = ref.read(billProvider).icon;

            DatabaseHelper.createBill(
                Bill(amount: amount, note: note, icon: icon));

            ref.read(billProvider.notifier).setAmount(0);
            ref.read(billProvider.notifier).setNote("");
            ref.read(billProvider.notifier).setIcon("");
            ref.read(priceInputController).clear();
            ref.read(noteInputController).clear();
            ref.read(categoryProvider.notifier).state = -1;
          } : null,
          child: Center(
            child: Text("提交",
                style: TextStyle(
                  color: (ref.watch(billProvider).icon != "" &&
                          ref.watch(billProvider).note != "" &&
                          ref.watch(billProvider).amount != 0)
                      ? const Color(0xffFCFCFC)
                      : LightTheme.lightGray,
                  fontSize: 16.w,
                )),
          )),
    );
  }
}
