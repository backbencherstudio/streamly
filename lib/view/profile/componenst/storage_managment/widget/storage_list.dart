import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/icons/icons.dart';
import '../../../../../config/images/images.dart';
import '../../../../../themes/color.dart';

class StorageList extends StatefulWidget {
  const StorageList({super.key});

  @override
  State<StorageList> createState() => _StorageListState();
}

class _StorageListState extends State<StorageList> {
  List<Map<String, dynamic>> downloads = List.generate(8, (index) {
    return {
      'title': 'Lightyear',
      'duration': '1h 42m 33s',
      'size': '1.4 GB',
      'image': AppImages.download_1,
    };
  });

  void _deleteItem(int index) {
    setState(() {
      downloads.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: downloads.length,
      padding: EdgeInsets.only(bottom: 24.h),
      itemBuilder: (context, index) {
        final item = downloads[index];
        return Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  item['image'],
                  height: 112.h,
                  width: 114.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['title'],
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _deleteItem(index),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(color: Colors.red),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppIcons.delete,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      item['duration'],
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.buttonText,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Color(0xff140620),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        item['size'],
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
