import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/config/icons/icons.dart';
import 'package:streamly/config/images/images.dart';

class DetailScreenHeader extends StatelessWidget {
  const DetailScreenHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.home_header,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.8),
                ],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: const Color(0xff472C2A),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(AppIcons.backArrow,
                            width: 20.w, height: 20.w),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: const Color(0xff472C2A),
                        shape: BoxShape.circle,
                      ),
                      child:
                          Image.asset(AppIcons.cast, width: 20.w, height: 20.w),
                    ),
                  ],
                ),
                // You can continue adding title, rating, etc. here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
