import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/view/profile/componenst/manage_plan/widget/most_popular_plan.dart';
import 'package:streamly/widgets/primary_button.dart';

import '../../../../core/constants/images/images.dart';
import '../../../../widgets/custom_nab_ver.dart';

class ManagePlaneScreen extends StatelessWidget {
  const ManagePlaneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(AppImages.background, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 36.h,
                    ),
                    CustomNabVer(
                      title: 'Manage Your Plan',
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Text(
                      "Enjoy watching Full-HD movies, without restrictions and without ads",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    MostPopularPlan(title: "Most Popular", price: '9.99'),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child:
                                MostPopularPlan(title: "Basic", price: '4.99')),
                        SizedBox(
                          width: 16.w,
                        ),
                        Expanded(
                            child: MostPopularPlan(
                                title: "Family", price: '14.99')),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    PrimaryButton(
                        text: 'Update Payment Method',
                        onTap: () {
                          context.push('/paymentMethodScreen');
                        }),
                    SizedBox(
                      height: 35.h,
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
