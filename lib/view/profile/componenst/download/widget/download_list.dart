import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DownloadList extends StatefulWidget {
  const DownloadList({super.key});

  @override
  State<DownloadList> createState() => _DownloadListState();
}

class _DownloadListState extends State<DownloadList> {
  List<Map<String, String>> data = [
    {
      'image': 'assets/images/download_1.png',
      'name': 'Lightyear',
      'time': '1h 42m 33s',
      'size': '1.4 GB',
    },
    {
      'image': 'assets/images/download_2.png',
      'name': 'Lightyear',
      'time': '1h 42m 33s',
      'size': '1.4 GB',
    },
    {
      'image': 'assets/images/download_3.png',
      'name': 'Lightyear',
      'time': '1h 42m 33s',
      'size': '1.4 GB',
    },
    {
      'image': 'assets/images/download_4.png',
      'name': 'Lightyear',
      'time': '1h 42m 33s',
      'size': '1.4 GB',
    },
    {
      'image': 'assets/images/download_5.png',
      'name': 'Lightyear',
      'time': '1h 42m 33s',
      'size': '1.4 GB',
    },
    {
      'image': 'assets/images/download_6.png',
      'name': 'Lightyear',
      'time': '1h 42m 33s',
      'size': '1.4 GB',
    },
  ];

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return Center(
        child: Text(
          'No Data Available',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 24.h),
      itemBuilder: (BuildContext context, int index) {
        final item = data[index];
        return Container(
          margin: EdgeInsets.only(bottom: 6.h),
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
                  item['image']!,
                  height: 112.h,
                  width: 150.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name']!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      item['time']!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xff140620),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            item['size']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              data.removeAt(index);
                            });
                          },
                          child: Image.asset(
                            'assets/icons/delete.png',
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                      ],
                    ),
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
