import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/view/home/widget/category_vedio_list.dart';
import 'package:streamly/view/home/widget/header_section.dart';
import 'package:streamly/view/home/widget/movie_carosal.dart';

import '../../core/themes/color.dart';
import '../../data/bloc/library_bloc/library_bloc.dart';
import '../../data/bloc/library_bloc/library_event.dart';
import '../../data/bloc/library_bloc/library_state.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LibraryBloc()..add(LoadLibrary()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              SizedBox(height: 16.h),
              const MovieCarousel(),
              SizedBox(height: 16.h),
              SizedBox(height: 8.h),
              BlocBuilder<LibraryBloc, LibraryState>(
                builder: (context, state) {
                  if (state is LibraryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LibraryLoaded) {
                    return ListView.builder(
                      padding: EdgeInsets.only(bottom: 16.h),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        final category = state.categories[index];
                        return CategorySectionForHome(
                          category: category,
                          key: ValueKey(category.title),
                        );
                      },
                    );
                  } else if (state is LibraryError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
