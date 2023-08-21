import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/providers/bill.dart';
import 'package:tally/themes/light.dart';

class NoteInput extends ConsumerWidget {
  const NoteInput({super.key});

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
                "备注",
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
        SizedBox(
          width: 382.w,
          height: 48.h,
          child: TextField(
            onChanged: (value) {
              ref.read(billProvider.notifier).setNote(value);
            },
            style: const TextStyle(color: LightTheme.darkBlack),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 10).w,
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: LightTheme.silverMist,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: LightTheme.silverMist,
                ),
              ),
              hintText: '输入备注',
              hintStyle: const TextStyle(color: LightTheme.silverMist),
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }
}
