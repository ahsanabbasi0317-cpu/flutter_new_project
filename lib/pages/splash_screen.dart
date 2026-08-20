import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11854A),
      body: Stack(
        children: [
          // Pink line
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 3.w,
            child: Container(
              color: const Color(0xFFFF1493),
            ),
          ),

          // Logo
          Center(
            child: Text(
              'Luxeyline',
              style: TextStyle(
                color: Colors.white,
                fontSize: 38.sp,
                fontFamily: 'Georgia',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Version
          Positioned(
            left: 0,
            right: 0,
            bottom: 35.h,
            child: Center(
              child: Text(
                'Version 1.56.2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
