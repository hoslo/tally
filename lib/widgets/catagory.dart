import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/providers/bill.dart';
import 'package:tally/themes/light.dart';

final categoryProvider = StateProvider<int>((ref) => -1);

class Category extends ConsumerStatefulWidget {
  const Category({super.key});

  static final list = [
    {
      "icon": "assets/icons/Food.svg",
      "name": "餐饮",
    },
    {
      "icon": "assets/icons/Medican.svg",
      "name": "看病",
    },
    {
      "icon": "assets/icons/Market.svg",
      "name": "购物",
    },
    {
      "icon": "assets/icons/Cat.svg",
      "name": "宠物",
    },
    {
      "icon": "assets/icons/Coffee.svg",
      "name": "饮料",
    }
  ];

  @override
  ConsumerState<Category> createState() => _CategoryState();
}

class _CategoryState extends ConsumerState<Category> {

  @override
  Widget build(BuildContext context) {
    int selectIndex = ref.watch(categoryProvider);
    return SizedBox(
        width: 382.w,
        height: 283.h,
        child: GridView.builder(
          itemCount: Category.list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  ref.read(categoryProvider.notifier).state = index;
                  ref.read(billProvider.notifier).setIcon(
                        Category.list[index]["icon"]!,
                      );
                });
              },
              child: Container(
                  width: 92.5.w,
                  height: 82.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)).w,
                    border: Border.all(
                        width: 1.w,
                        color: selectIndex == index
                            ? LightTheme.lightBlue
                            : LightTheme.silverMist),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Category.list[index]["icon"]!,
                        colorFilter: ColorFilter.mode(
                            selectIndex == index
                                ? LightTheme.lightBlue
                                : LightTheme.darkBlack,
                            BlendMode.srcIn),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        Category.list[index]["name"]!,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: selectIndex == index
                                ? LightTheme.lightBlue
                                : LightTheme.darkBlack),
                      )
                    ],
                  )),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 4.h,
            crossAxisSpacing: 3.75.w,
          ),
        ));
  }
}
