import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../themes/color.dart';

class LiveViewInputBar extends StatelessWidget {
  final TextEditingController commentController;
  final Function(String) onSubmit;
  final VoidCallback onHeartTap;

  const LiveViewInputBar({
    Key? key,
    required this.commentController,
    required this.onSubmit,
    required this.onHeartTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.h,
      left: 12.w,
      right: 12.w,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: commentController,
              style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: "Add a comment",
                hintStyle: TextStyle(color: AppColors.lightGrey, fontSize: 14.sp),
                filled: true,
                fillColor: AppColors.black.withOpacity(0.45),
                contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: onSubmit,
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: onHeartTap,
            child: Icon(Icons.favorite, color: AppColors.primary, size: 26.sp),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () => onSubmit(commentController.text),
            child: Icon(Icons.send, color: AppColors.textPrimary, size: 26.sp),
          ),
        ],
      ),
    );
  }
}
