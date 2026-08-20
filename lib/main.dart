import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'pages/splash_screen.dart';

void main() {
  runApp(const LuxeylineApp());
}

class LuxeylineApp extends StatelessWidget {
  const LuxeylineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Luxeyline',
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
