import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;

  const PersonCard({
    super.key,
    required this.name,
    required this.role,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Image.network(
            imageUrl,
            width: 56.w,
            height: 56.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              role,
              style: TextStyle(
                color: Color(0xffE0E0E0),
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
