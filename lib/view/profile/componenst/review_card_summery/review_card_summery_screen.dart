import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamly/view/profile/componenst/review_card_summery/widget/card_info.dart';
import 'package:streamly/view/profile/componenst/review_card_summery/widget/price_summery_card.dart';
import 'package:streamly/view/profile/componenst/review_card_summery/widget/summery_card.dart';
import '../../../../config/icons/icons.dart';
import '../../../../config/images/images.dart';
import '../../../../widgets/custom_nab_ver.dart';
import '../../../../widgets/primary_button.dart';

class ReviewCardSummeryScreen extends StatelessWidget {
  const ReviewCardSummeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(AppImages.background, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomNabVer(
                              title: "Review Summary",
                              trailing: AppIcons.scan,
                            ),
                            SizedBox(height: 24.h),
                            CardInfo(),
                            SizedBox(height: 24.h),
                            SummeryCard(),
                            SizedBox(height: 32.h),
                            Text(
                              "Pricing summary",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 24.h),
                            PriceSummeryCard(),
                            SizedBox(height: 50.h),
                            PrimaryButton(
                              text: "Continue",
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const SubscriptionSuccessDialog(),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubscriptionSuccessDialog extends StatelessWidget {
  const SubscriptionSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF2D0D47),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(top: -2, left: -12, child: dot(height: 8, width: 8)),
                Positioned(top: 0, right: -10, child: dot(height: 6, width: 6)),
                Positioned(top: 20, right: -6, child: dot(height: 9, width: 9)),

                Positioned(
                    bottom: -6, right: 18, child: dot(height: 7, width: 7)),
                Positioned(
                    bottom: 2, left: -4, child: dot(height: 6, width: 6)),
                Positioned(top: 28, left: 24, child: dot(height: 8, width: 8)),

                Positioned(
                    bottom: 22, right: -4, child: dot(height: 9, width: 9)),
                Positioned(
                    bottom: -10, left: 16, child: dot(height: 7, width: 7)),
                Positioned(top: -10, left: 40, child: dot(height: 5, width: 5)),
                Positioned(
                    top: 10, right: -14, child: dot(height: 6, width: 6)),
                Positioned(
                    bottom: -12, right: 40, child: dot(height: 6, width: 6)),
                Positioned(
                    bottom: 30, left: -10, child: dot(height: 5, width: 5)),
                Positioned(top: 36, left: -8, child: dot(height: 6, width: 6)),

                Positioned(top: 8, left: 60, child: dot(height: 4, width: 4)),
                Positioned(
                    bottom: -14, left: 44, child: dot(height: 5, width: 5)),
                Positioned(
                    bottom: 10, right: -12, child: dot(height: 8, width: 8)),
                Positioned(top: 44, right: 16, child: dot(height: 6, width: 6)),
                // Main icon
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF9D4EDD),
                  ),
                  child: Image.asset(AppIcons.subscription_success),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              "Subscription Successful!",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              "You have subscribed to Streamly for\n1 month. Enjoy the benefits!",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            PrimaryButton(
              text: "Ok",
              onTap: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            )
          ],
        ),
      ),
    );
  }

  Widget dot({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: Color(0xff7A25BC),
        shape: BoxShape.circle,
      ),
    );
  }
}
