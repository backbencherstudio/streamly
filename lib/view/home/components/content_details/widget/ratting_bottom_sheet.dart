import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/themes/color.dart';
import 'package:streamly/widgets/primary_button.dart';

void showRattingBottomSheet(BuildContext context) {
  double rating = 4;

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: const Color(0xff0B0314),
    isScrollControlled: true,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 24.h,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Give Rating",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.h),
              Divider(color: Color(0xff1D082E),),
              SizedBox(height: 16.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "9.8",
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: "/10",
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(height: 10.h),
                      StarRating(
                        borderColor: AppColors.textPurple,

                        rating: rating,
                        starCount: 5,
                        size: 20,
                        allowHalfRating: false,
                        onRatingChanged: (newRating) {
                          setState(() {
                            rating = newRating;
                          });
                        },
                        color: AppColors.textPurple,
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        '(24.679 users)',
                        style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp),
                      ),
                    ],
                  ),
                  SizedBox(width: 24.w),
                  Expanded(
                    child: Column(
                      children: List.generate(5, (index) {
                        int star = 5 - index;
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16.w,
                                child: Text(
                                  "$star",
                                  style:
                                      TextStyle(color: AppColors.textPrimary),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: 0.1 * (star.toDouble()),
                                  backgroundColor: Colors.grey[800],
                                  color: AppColors.textPurple,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Divider(color: Color(0xff1D082E),),
              SizedBox(
                height: 16.h,
              ),
              StarRating(
                borderColor: AppColors.textPurple,
                rating: rating,
                starCount: 5,
                size: 70,
                allowHalfRating: false,
                onRatingChanged: (newRating) {
                  setState(() {
                    rating = newRating;
                  });
                },
                color: AppColors.textPurple,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      text: "Cancel",
                      onTap: () => Navigator.pop(context),
                      color: const Color(0xff1C082C),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: PrimaryButton(
                      text: "Submit",
                      onTap: () {
                        // Handle rating submit here
                        Navigator.pop(context);
                      },
                      color: const Color(0xff7A25BC),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
