import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../block/library_bloc/library_bloc.dart';
import '../../../block/library_bloc/library_event.dart';
import 'filter_modal_sheet.dart'; // Make sure this file exists

class SearchBarLibrary extends StatelessWidget {
  const SearchBarLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.white12, width: 1),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.white60, size: 20.sp),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      onTap: () {
                        context.read<LibraryBloc>().add(FocusSearchField(true));
                      },
                      onChanged: (text) {
                        context.read<LibraryBloc>().add(SearchQueryChanged(text));
                      },
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: 'Search..........',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        border: InputBorder.none,
                        isCollapsed: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Mic icon tapped');
                    },
                    child: Icon(Icons.mic, color: Colors.white38, size: 20.sp),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: "Filter",
                barrierColor: Colors.black54,
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (_, __, ___) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 110.h), // or use .only(top: 60) without screenutil
                      child: const FilterDialog(),
                    ),
                  );

                },
                transitionBuilder: (_, anim, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim),
                    child: child,
                  );
                },
              );
            },
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white12, width: 1),
              ),
              child: Icon(Icons.tune, color: Colors.white70, size: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}
