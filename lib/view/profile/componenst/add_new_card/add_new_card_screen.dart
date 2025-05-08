import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:streamly/widgets/primary_button.dart';
import '../../../../config/icons/icons.dart';
import '../../../../config/images/images.dart';
import '../../../../widgets/custom_nab_ver.dart';
import '../../../../widgets/custom_text_field.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: SvgPicture.asset(AppImages.background, fit: BoxFit.cover),
          ),

          // Foreground content
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomNabVer(
                      title: "Add New Card",
                      trailing: AppIcons.scan,
                    ),
                    SizedBox(height: 32.h),

                    // Card Preview
                    Container(
                      height: 200.h,
                      width: double.infinity,
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        image: DecorationImage(
                          image: AssetImage(AppImages.visa),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Credit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Image.asset(AppImages.visa_text),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "1234 5678 9012 3456",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Sophia Carter",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // Card Number
                    Text("Card Number",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    SizedBox(height: 8.h),
                    CustomTextField(hintText: "3827 4637 3103 4679"),
                    SizedBox(height: 16.h),

                    // Card Name
                    Text("Card Name",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    SizedBox(height: 8.h),
                    CustomTextField(hintText: "Sophia Carter"),
                    SizedBox(height: 16.h),

                    // Expiry and CVV
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Expiry Date",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                              SizedBox(height: 8.h),
                              CustomTextField(
                                hintText: "06/12/25",
                                suffixIcon: Image.asset(
                                  AppIcons.calender,
                                  scale: 2,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("CVV",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                              SizedBox(height: 8.h),
                              CustomTextField(
                                hintText: "244",
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),

                    // Save Button
                    PrimaryButton(text: 'Add', onTap: () {}),
                    SizedBox(height: 32.h),
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
