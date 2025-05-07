import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const NotificationTile({
    Key? key,
    required this.title,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 4.h),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 17.sp, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      trailing: trailing ??
          Icon(Icons.arrow_forward_ios, size: 20.sp, color: Colors.grey),
      onTap: onTap,
    );
  }
}
