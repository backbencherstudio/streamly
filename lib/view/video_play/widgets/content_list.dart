import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../block/content/content_bloc.dart';
import '../../../block/content/content_event.dart';
import '../../../model/content/content_model.dart';

class ContentList extends StatelessWidget {
  final List<ContentItem> items;
  final String selectedId;

  const ContentList({Key? key, required this.items, required this.selectedId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      itemCount: items.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final item = items[index];
        final isPlaying = item.id == selectedId;

        return GestureDetector(
          onTap: () {
            if (!isPlaying) {
              context.read<ContentBloc>().add(ChangeVideoEvent(selectedItem: item));
            }
          },
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      item.thumbnailUrl,
                      width: 120.w,
                      height: 70.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Icon(Icons.play_circle_fill, size: 32.sp, color: Colors.white70),
                ],
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    if (isPlaying)
                      Text(
                        "Playing",
                        style: TextStyle(color: Colors.purpleAccent, fontSize: 12.sp),
                      ),
                    Text(
                      "2h 32min",
                      style: TextStyle(color: Colors.white54, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_vert, color: Colors.white70, size: 20.sp),
            ],
          ),
        );
      },
    );
  }
}
