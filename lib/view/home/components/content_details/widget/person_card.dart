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
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            imageUrl,
            width: 56.w,
            height: 56.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          role,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 11.sp,
          ),
        ),
      ],
    );
  }
}
