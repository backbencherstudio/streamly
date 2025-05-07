import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:streamly/config/images/images.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  State<MovieCarousel> createState() => _CenteredCarouselState();
}

class _CenteredCarouselState extends State<MovieCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.55);
  int _currentPage = 0;

  final List<String> images = [
    AppImages.carosal_1,
    AppImages.carosal_1,
    AppImages.carosal_1,
    AppImages.carosal_1,
    AppImages.carosal_1,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.translate(
          offset: Offset(-20, 0),
          child: SizedBox(
            height: 100.h,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: _controller,
              itemCount: images.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 0 : 8.w,
                    right: 8.w,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      images[index],
                      width: 220.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Center(
          child: SmoothPageIndicator(
            controller: _controller,
            count: images.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.deepPurpleAccent,
              dotColor: Colors.deepPurpleAccent.withOpacity(0.3),
              dotHeight: 6.h,
              dotWidth: 20.w,
              spacing: 8.w,
              expansionFactor: 2,
              radius: 8.r,
            ),
          ),
        ),
      ],
    );
  }
}
