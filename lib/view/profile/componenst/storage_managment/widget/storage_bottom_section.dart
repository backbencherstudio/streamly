import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/widgets/outlined_primary_button.dart';

import '../../../../../core/themes/color.dart';

class StorageBottomSection extends StatefulWidget {
  const StorageBottomSection({super.key});

  @override
  State<StorageBottomSection> createState() => _StorageBottomSectionState();
}

class _StorageBottomSectionState extends State<StorageBottomSection> {
  bool autoDeleteOldContent = false;
  bool clearWhenLowStorage = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Easy Management",
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(
          'Save time with bulk actions—clear all downloads at once or auto-delete old content when storage is low. Manage space with ease.',
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white70),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Auto-delete old content",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 4.h,
                ),
                Text("*When Low on Space",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp)),
              ],
            ),
            Transform.scale(
              scale: 0.9,
              child: CupertinoSwitch(
                activeTrackColor: AppColors.textPurple,
                value: autoDeleteOldContent,
                onChanged: (val) {
                  setState(() => autoDeleteOldContent = val);
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cloud Sync",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 4.h,
                ),
                Text("*Movies backed up",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp)),
              ],
            ),
            Transform.scale(
              scale: 0.9,
              child: CupertinoSwitch(
                activeTrackColor: AppColors.textPurple,
                value: clearWhenLowStorage,
                onChanged: (val) {
                  setState(() => clearWhenLowStorage = val);
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Clear All Downloads",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp)),
            SizedBox(
              width: 24.w,
            ),
            Expanded(
              child: SizedBox(
                height: 44,
                child: OutlinedPrimaryButton(
                  text: 'Bulk Delete',
                  onTap: () {
                    // handle clear all
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
