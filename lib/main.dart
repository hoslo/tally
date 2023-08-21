import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tally/screens/expend.dart';
import 'package:tally/screens/statistics.dart';
import 'package:tally/sql_helper.dart';
import 'package:tally/widgets/bars/expend.dart';
import 'package:tally/widgets/bars/statistics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final db = await DatabaseHelper.db();
  await DatabaseHelper.createTables(db);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final w = 414 / ScreenUtil().pixelRatio!;
    final h = 896 / ScreenUtil().pixelRatio!;
    return ScreenUtilInit(
      designSize: Size(w, h),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF5986F2)),
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: const HomePage(title: 'First Method'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  static final List<Widget> _pages = [
    ExpendScreen(),
    const StatisticsScreen(),
    const Text('设置')
  ];
  static final List<PreferredSizeWidget> _appBars = [
    const ExpendAppBar(),
    const StatisticsAppBar(),
    AppBar(title: const Text('设置'))
  ];
  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _appBars.elementAt(_selectIndex),
        body: _pages.elementAt(_selectIndex),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Color(0xffD9D9D9), width: 1),
            ),
          ),
          child: BottomNavigationBar(
              currentIndex: _selectIndex,
              onTap: (index) {
                setState(() {
                  _selectIndex = index;
                });
              },
              selectedItemColor: const Color(0xff5986F2),
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/icons/Input.svg",
                        colorFilter: ColorFilter.mode(
                            _selectIndex == 0
                                ? const Color(0xff5986F2)
                                : const Color(0xff333333),
                            BlendMode.srcIn)),
                    label: "录入"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/icons/Report.svg",
                        colorFilter: ColorFilter.mode(
                            _selectIndex == 1
                                ? const Color(0xff5986F2)
                                : const Color(0xff333333),
                            BlendMode.srcIn)),
                    label: "统计"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/icons/Settings.svg",
                        colorFilter: ColorFilter.mode(
                            _selectIndex == 2
                                ? const Color(0xff5986F2)
                                : const Color(0xff333333),
                            BlendMode.srcIn)),
                    label: "设置"),
              ]),
        ),
      ),
    );
  }
}
