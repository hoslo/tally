import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/providers/statistics.dart';
import 'package:tally/themes/light.dart';

class StatisticsAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const StatisticsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  ConsumerState<StatisticsAppBar> createState() => _StatisticsAppBarState();
}

class _StatisticsAppBarState extends ConsumerState<StatisticsAppBar> {
  String _value = "月统计";

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: LightTheme.primaryColor,
      titleSpacing: 0,
      title: DropdownButton(
        underline: Container(),
        icon: SvgPicture.asset('assets/icons/CaretDown.svg'),
        focusColor: LightTheme.darkBlack,
        iconEnabledColor: LightTheme.darkBlack,
        value: _value,
        padding: EdgeInsets.only(right: 8.w),
        isExpanded: true,
        items: [
          DropdownMenuItem(
            value: "月统计",
            enabled: true,
            child: Center(
              child: Text("月统计",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: LightTheme.darkBlack)),
            ),
          ),
          DropdownMenuItem(
              value: "周统计",
              child: Center(
                child: Text(
                  "周统计",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: LightTheme.darkBlack),
                ),
              )),
        ],
        onChanged: (value) {
          ref.read(statisticTypeProvider.notifier).state = value!;
          setState(() {
            _value = value;
          });
        },
      ),
    );
  }
}
