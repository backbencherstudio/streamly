import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../themes/color.dart';

class Faq extends StatelessWidget {
  final List<String> faqList;

  const Faq({super.key, required this.faqList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.textPurple),
        color: const Color(0xff07020A),
      ),
      child: Column(
        children: faqList
            .asMap()
            .entries
            .map(
              (entry) => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        entry.value,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  if (entry.key < faqList.length - 1)
                    Divider(
                      color: const Color(0xff1C082B),
                      height: 1,
                    ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
