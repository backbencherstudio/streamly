import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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

      // backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: SvgPicture.asset(AppImages.background, fit: BoxFit.cover),
          ),

          // Content
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

                            // Card Info
                            CardInfo(),

                            SizedBox(height: 24.h),

                            // Summary Card
                            SummeryCard(),

                            SizedBox(height: 32.h),

                            // Pricing Summary Title
                            Text(
                              "Pricing summary",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            SizedBox(height: 24.h),

                            // Pricing Summary Box
                            PriceSummeryCard(),

                            SizedBox(height: 50.h),
                            PrimaryButton(
                              text: "Continue",
                              onTap: () {
                                context.go('/payment-complete');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Fixed Continue Button
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
