import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/icons/icons.dart';

class CustomNabVer extends StatelessWidget {
  final String? title;
  final String? trailing;
  const CustomNabVer({super.key,  this.title, this.trailing});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( vertical: 12.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xff1D092E),
            ),
            child: Image.asset(AppIcons.backArrow, width: 20.w, height: 20.w),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              title ?? '',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (trailing != null)
            Image.asset(
              trailing!,
              height: 23,
            ),
        ],
      ),
    );
  }
}
