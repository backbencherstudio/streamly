import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarLibrary extends StatelessWidget {
  const SearchBarLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: TextField(
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.white, size: 20.sp),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
