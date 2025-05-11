import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget priceRow(String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: TextStyle(color: Colors.white70, fontSize: 14.sp),
      ),
      Text(
        value,
        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
      ),
    ],
  );
}