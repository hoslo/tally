import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/providers/bill.dart';

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
                  color: const Color(0xffA6A6A6),
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
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 10).w,
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xffD9D9D9),
                  ),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xffD9D9D9),
                ),
              ),
              hintText: '输入备注',
              hintStyle: const TextStyle(color: Color(0xffD9D9D9)),
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
