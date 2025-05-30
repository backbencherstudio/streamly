import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/themes/color.dart';
import '../../../block/content/content_state.dart';
import 'content_list.dart';

class ContentTab extends StatelessWidget {
  final String title;
  final ContentLoaded state;

  const ContentTab({
    super.key,
    required this.title,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ContentList(
            items: state.items,
            selectedId: state.selectedItem.id,
          ),
        ),
      ],
    );
  }
}
