import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tally/themes/light.dart';

class ExpendAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ExpendAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: LightTheme.primaryColor,
      titleSpacing: 0,
      title: Text("支出",
          style: TextStyle(
            color: LightTheme.darkBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          )),
    );
  }
}
