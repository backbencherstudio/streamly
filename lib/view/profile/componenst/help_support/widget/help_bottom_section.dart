import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/config/icons/icons.dart';
import 'package:streamly/themes/color.dart';

class HelpBottomSection extends StatelessWidget {
  const HelpBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        Divider(color: Color(0xff180723)),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(AppIcons.streamly, height: 50, width: 60),
            Row(
              children: [
                _circleIcon(text: "f"),
                SizedBox(width: 8.w),
                _circleIcon(text: "O"),
                SizedBox(width: 8.w),
                _circleIcon(text: "in"),
                SizedBox(width: 8.w),
                _circleIcon(icon: Icons.play_arrow),
              ],
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Divider(color: Color(0xff180723)),
        SizedBox(height: 24.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _linkColumn("Company", [
                "About Us",
                "Careers",
                "Contact Us",
              ]),
            ),
            Expanded(
              child: _linkColumn("Legal", [
                "Terms of Service",
                "Privacy Policy",
                "Cookies",
              ]),
            ),
            Expanded(
              child: _linkColumn("Support", [
                "Contact Support",
                "Help Center",
                "Accessibility",
              ]),
            ),
          ],
        )
      ],
    );
  }

  Widget _circleIcon({String? text, IconData? icon}) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.textPrimary,
      ),
      child: Center(
        child: text != null
            ? Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              )
            : Icon(
                icon,
                color: Colors.black,
                size: 20,
              ),
      ),
    );
  }

  Widget _linkColumn(String heading, List<String> items) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          ...items.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(
                item,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
