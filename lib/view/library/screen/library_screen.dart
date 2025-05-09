import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../block/library_bloc/library_bloc.dart';
import '../../../block/library_bloc/library_event.dart';
import '../../../block/library_bloc/library_state.dart';
import '../widgets/category_section.dart';
import '../widgets/search_bar.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LibraryBloc()..add(LoadLibrary()),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/images/background.svg',
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  const SearchBarLibrary(),
                  Expanded(
                    child: BlocBuilder<LibraryBloc, LibraryState>(
                      builder: (context, state) {
                        if (state is LibraryLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is LibraryLoaded) {
                          return ListView.builder(
                            padding: EdgeInsets.only(bottom: 16.h),
                            itemCount: state.categories.length,
                            itemBuilder: (context, index) {
                              final category = state.categories[index];
                              return CategorySection(category: category, key: ValueKey(category.title));
                            },
                          );
                        } else if (state is LibraryError) {
                          return Center(
                            child: Text(
                              state.message,
                              style: TextStyle(color: Colors.white, fontSize: 14.sp),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
