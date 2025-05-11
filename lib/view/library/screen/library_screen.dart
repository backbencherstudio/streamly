import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/routes/routes.dart';
import 'package:streamly/themes/color.dart';
import '../../../block/library_bloc/library_bloc.dart';
import '../../../block/library_bloc/library_event.dart';
import '../../../block/library_bloc/library_state.dart';
import '../widgets/category_section.dart';
import '../widgets/search_bar.dart';
import '../widgets/search_suggestion_widget.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LibraryBloc()..add(LoadLibrary()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  const SearchBarLibrary(),
                  SizedBox(height: 8.h),
                  BlocBuilder<LibraryBloc, LibraryState>(
                    builder: (context, state) {
                      final showWidget =
                          state is LibraryLoaded && state.showSuggestions;
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                              opacity: animation, child: child);
                        },
                        child: showWidget
                            ? SearchSuggestionWidget(
                                key: const ValueKey("suggestions_visible"),
                                suggestions: [
                                  "Latest",
                                  "TV Series",
                                  "Comedy",
                                  "Drama",
                                  "Romance",
                                  "Family",
                                  "Kids",
                                  "Horror",
                                  "Shorts"
                                ],
                                onTap: (text) {
                                  context.push(RoutesName.searchResult);
                                  print("Selected: $text");
                                },
                              )
                            : const SizedBox(
                                key: ValueKey("suggestions_hidden"),
                              ),
                      );
                    },
                  ),
                  SizedBox(height: 8.h),
                  Expanded(
                    child: BlocBuilder<LibraryBloc, LibraryState>(
                      builder: (context, state) {
                        if (state is LibraryLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is LibraryLoaded) {
                          return ListView.builder(
                            padding: EdgeInsets.only(bottom: 16.h),
                            itemCount: state.categories.length,
                            itemBuilder: (context, index) {
                              final category = state.categories[index];
                              return CategorySection(
                                  category: category,
                                  key: ValueKey(category.title));
                            },
                          );
                        } else if (state is LibraryError) {
                          return Center(
                            child: Text(
                              state.message,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.sp),
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
