import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/themes/color.dart';
import 'package:streamly/view/profile/componenst/review_card_summery/widget/price_row.dart';

class PriceSummeryCard extends StatelessWidget {
  const PriceSummeryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xff200A2B),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          priceRow("Amount", "\$20.64"),
          SizedBox(height: 8.h),
          priceRow("Tax", "\$5"),
          SizedBox(height: 8.h),
          Divider(color: Color(0xff7A25BC)),
          priceRow("Daily housekeeping", "\$26.64"),
        ],
      ),
    );
  }
}
