import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: 'Find your perfect rental on Redfin',
      description:
          
          'Find your perfect home and discover amazing places.',
    ),
    OnboardingData(
      title: 'Sell for top dollar and save thousands on fees',
      description:
         
          'Sell your property faster with less fees.',
    ),
    OnboardingData(
      title: 'Local expertise for luxury homes',
      description:
          
          'Discover luxury homes with local expertise.',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      // Yahan baad mein HomeScreen par navigation laga sakte ho.
    }
  }

  void _skip() {
    _pageController.animateToPage(
      _pages.length - 1,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // =========================
            // TOP BAR
            // =========================
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 14.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: _skip,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: const Color(0xFF11854A),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // =========================
            // ONBOARDING PAGES
            // =========================
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildPage(_pages[index]);
                },
              ),
            ),

            // =========================
            // PAGE INDICATOR
            // =========================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) {
                  final bool isActive = index == _currentPage;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    width: isActive ? 16.w : 5.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xFF11854A)
                          : const Color(0xFFD5D5D5),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 12.h),

            // =========================
            // CONTINUE BUTTON
            // =========================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: double.infinity,
                height: 46.h,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF11854A),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: Text(
                    _currentPage == _pages.length - 1
                        ? 'Get Started'
                        : 'Continue',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 18.h),

            // =========================
            // BOTTOM HOME INDICATOR
            // =========================
            Container(
              width: 65.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: const Color(0xFF17243A),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),

            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }

  // =========================
  // SINGLE ONBOARDING PAGE
  // =========================
  Widget _buildPage(OnboardingData data) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 18.h),

          // =========================
          // IMAGE PLACEHOLDER
          // =========================
          Container(
            width: double.infinity,
            height: 310.h,
            decoration: BoxDecoration(
              color: const Color(0xFFE9F2EE),
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Icon(
              Icons.image_outlined,
              size: 55.sp,
              color: const Color(0xFF11854A),
            ),
          ),

          SizedBox(height: 28.h),

          // =========================
          // TITLE
          // =========================
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF111111),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),

          SizedBox(height: 14.h),

          // =========================
          // DESCRIPTION
          // =========================
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              data.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF999999),
                fontSize: 9.sp,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================
// ONBOARDING DATA MODEL
// =====================================

class OnboardingData {
  final String title;
  final String description;

  OnboardingData({
    required this.title,
    required this.description,
  });
}
