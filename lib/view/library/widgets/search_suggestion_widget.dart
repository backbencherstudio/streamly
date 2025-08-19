import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/color.dart';

class SearchSuggestionWidget extends StatelessWidget {
  final List<String> suggestions;
  final void Function(String)? onTap;

  const SearchSuggestionWidget({
    super.key,
    required this.suggestions,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      children: suggestions.map((text) {
        return GestureDetector(
          onTap: () => onTap?.call(text),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.textPurple, width: 1.2),
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.containerBackground,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.textPurple,
                fontSize: 14.sp,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
