import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../block/library_bloc/library_bloc.dart';
import '../../../block/library_bloc/library_event.dart';

class SearchBarLibrary extends StatelessWidget {
  const SearchBarLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: TextField(
          onTap: () {
            context.read<LibraryBloc>().add(FocusSearchField(true));
          },
          style: TextStyle(color: Colors.white, fontSize: 14.sp),
          onChanged: (text) {
            context.read<LibraryBloc>().add(SearchQueryChanged(text));
          },
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: Colors.white, size: 20.sp),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

