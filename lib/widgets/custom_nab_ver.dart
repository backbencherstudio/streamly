import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/icons/icons.dart';

class CustomNabVer extends StatelessWidget {
  final String? title;
  final String? trailing;
  final String? fromScreen;
  final VoidCallback? onTap;
  const CustomNabVer(
      {super.key, this.title, this.trailing, this.onTap, this.fromScreen});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          fromScreen == 'favorite'
              ? Container()
              : GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xff1D092E),
                    ),
                    child: Image.asset(AppIcons.backArrow,
                        width: 20.w, height: 20.w),
                  ),
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
            GestureDetector(
              onTap: onTap,
              child: Image.asset(
                trailing!,
                height: 23,
              ),
            ),
        ],
      ),
    );
  }
}
