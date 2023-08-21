import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/providers/bill.dart';
import 'package:tally/themes/light.dart';

class PriceInput extends ConsumerWidget {
  const PriceInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16).w,
              child: Text(
                "费用",
                style: TextStyle(
                  color: LightTheme.lightGray,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Container(
              width: 382.w,
              height: 56.h,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Container(
                      width: 44.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        color: LightTheme.lightGreyWhite,
                        border: const Border(
                            right: BorderSide(
                                color: LightTheme.silverMist, width: 0),
                            left: BorderSide(
                                color: LightTheme.silverMist, width: 1),
                            top: BorderSide(
                                color: LightTheme.silverMist, width: 1),
                            bottom: BorderSide(
                                color: LightTheme.silverMist, width: 1)),
                        borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(8).w,
                                bottomLeft: const Radius.circular(8).w)
                            .w,
                      ),
                      child: Center(
                        child: Text("¥",
                            style: TextStyle(
                              fontSize: 32.sp,
                              color: LightTheme.charcoalGrey,
                              fontWeight: FontWeight.w400,
                            )),
                      )),
                  SizedBox(
                    width: 338.w,
                    height: 56.h,
                    child: TextField(
                      style: TextStyle(
                          fontSize: 32.sp, color: LightTheme.darkBlack),
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true, signed: false),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[0-9]+.?[0-9]*')),
                      ],
                      onChanged: (value) {
                        ref
                            .read(billProvider.notifier)
                            .setAmount(double.parse(value));
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 0, 0, 10).w,
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: LightTheme.silverMist,
                            ),
                            borderRadius: BorderRadius.only(
                                topRight: const Radius.circular(8).w,
                                bottomRight: const Radius.circular(8).w)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topRight: const Radius.circular(8).w,
                              bottomRight: const Radius.circular(8).w),
                          borderSide: const BorderSide(
                            color: LightTheme.silverMist,
                          ),
                        ),
                        hintText: '0.00',
                        hintStyle: TextStyle(
                            fontSize: 32.sp, color: LightTheme.silverMist),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }
}
