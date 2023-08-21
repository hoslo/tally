import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/providers/bill.dart';
import 'package:tally/widgets/catagory.dart';
import 'package:tally/widgets/date_switch.dart';
import 'package:tally/widgets/input/price.dart';
import 'package:tally/widgets/input/submit.dart';

import '../widgets/input/note.dart';

class ExpendScreen extends ConsumerWidget {


  ExpendScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        const DateSwitch(),
        SizedBox(
          height: 24.w,
        ),
        const PriceInput(),
        const NoteInput(),
        SizedBox(
          height: 24.h,
        ),
        const Category(),
        const Submit()
      ],
    );
  }
}
