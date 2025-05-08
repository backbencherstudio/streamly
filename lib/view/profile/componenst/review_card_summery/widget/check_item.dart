import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCheckItem(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: Row(
      children: [
        Icon(Icons.check, color: Colors.greenAccent, size: 18.w),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    ),
  );
}