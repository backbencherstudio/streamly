import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});
  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  int _currentIndex = 0;
  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/carosal_1.png',
    },
    {
      'image': 'assets/images/carosal_2.png',
    },
    {
      'image': 'assets/images/carosal_3.png',
    },
    {
      'image': 'assets/images/carosal_4.png',
    },
    {
      'image': 'assets/images/carosal_1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 70.h, // Fixed height for the carousel

            autoPlay: true,
            enlargeCenterPage: false, // Disable enlarging to keep sizes uniform
            viewportFraction: 0.3, // Adjust to fit multiple items of fixed size
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: items.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: 100.w, // Fixed width for each item
                  height: 100.h, // Fixed height for each item
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image:
                          AssetImage(item['image']!), // Use AssetImage directly
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: Stack(
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10.r),
                  //         gradient: LinearGradient(
                  //           colors: [
                  //             Colors.black.withOpacity(0.5),
                  //             Colors.transparent,
                  //           ],
                  //           begin: Alignment.bottomCenter,
                  //           end: Alignment.topCenter,
                  //         ),
                  //       ),
                  //     ),
                  //     // Text overlay (currently commented out)
                  //   ],
                  // ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 10.h),
        // Dot Indicator
        SmoothPageIndicator(
          controller: PageController(initialPage: _currentIndex),
          count: items.length,
          effect: WormEffect(
            dotHeight: 6.h,
            dotWidth: 30.w,
            activeDotColor: Color(0xff7A25BC),
            dotColor: Color(0xff360F51),
            spacing: 8.w,
          ),
        ),
      ],
    );
  }
}
