import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routes/routes.dart';
import '../../../core/themes/color.dart';
import '../../../data/bloc/library_bloc/library_bloc.dart';
import '../../../data/bloc/library_bloc/library_event.dart';
import '../../../data/bloc/library_bloc/library_state.dart';
import '../../filter_result/widgets/movie_category_list.dart';
import '../../library/widgets/search_bar.dart';
import '../../library/widgets/search_suggestion_widget.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LibraryBloc()..add(LoadLibrary()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
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
                        return FadeTransition(opacity: animation, child: child);
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
                          debugPrint("Selected: $text");
                        },
                      )
                          : const SizedBox(
                        key: ValueKey("suggestions_hidden"),
                      ),
                    );
                  },
                ),
                SizedBox(height: 8.h),
                const SearchResultWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
