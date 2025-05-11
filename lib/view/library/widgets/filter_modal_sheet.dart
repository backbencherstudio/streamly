import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../block/library_bloc/library_bloc.dart';
import '../../../block/library_bloc/library_event.dart';
import '../../../block/library_bloc/library_state.dart';
import '../../../themes/color.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  final _keywordController = TextEditingController();
  final _topRatedController = TextEditingController();

  final List<String> dummyCategories = ['Action', 'Drama', 'Comedy'];
  final List<String> dummyGenres = ['Sci-Fi', 'Romance', 'Thriller'];

  String? selectedCategory;
  String? selectedGenre;
  DateTime? selectedYear;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          child: BlocBuilder<LibraryBloc, LibraryState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Browse By Advanced\nSearch Filter',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _buildDropdown(
                      label: 'Category',
                      items: dummyCategories,
                      value: selectedCategory,
                      onChanged: (value) {
                        setState(() => selectedCategory = value);
                        context.read<LibraryBloc>().add(CategoryChanged(value!));
                      },
                    ),
                    SizedBox(height: 12.h),
                    _buildDropdown(
                      label: 'Genres',
                      items: dummyGenres,
                      value: selectedGenre,
                      onChanged: (value) {
                        setState(() => selectedGenre = value);
                        context.read<LibraryBloc>().add(GenreChanged(value!));
                      },
                    ),
                    SizedBox(height: 12.h),
                    _buildDatePicker(context),
                    SizedBox(height: 12.h),
                    _buildTextField(
                      'Keywords',
                      Icons.search,
                      _keywordController,
                          (value) => context.read<LibraryBloc>().add(KeywordChanged(value)),
                    ),
                    SizedBox(height: 12.h),
                    _buildTextField(
                      'Top rated',
                      Icons.search,
                      _topRatedController,
                          (value) => context.read<LibraryBloc>().add(TopRatedChanged(value)),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required List<String> items,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryBorderColor),
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.containerBackground,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            label,
            style: TextStyle(color: AppColors.lightGrey, fontSize: 14.sp),
          ),
          items: items.map(
                (e) => DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
              ),
            ),
          ).toList(),
          value: value,
          onChanged: onChanged,
          dropdownColor: AppColors.surface,
          isExpanded: true,
          iconEnabledColor: AppColors.icon,
          style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final selected = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          builder: (context, child) =>
              Theme(data: ThemeData.dark(), child: child!),
        );
        if (selected != null) {
          setState(() => selectedYear = selected);
          context.read<LibraryBloc>().add(YearChanged(selected));
        }
      },
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondaryBorderColor),
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.containerBackground,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                selectedYear != null ? '${selectedYear!.year}' : 'Year',
                style: TextStyle(color: AppColors.lightGrey, fontSize: 14.sp),
              ),
            ),
            Icon(Icons.calendar_today_outlined,
                color: AppColors.icon, size: 18.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String hint,
      IconData icon,
      TextEditingController controller,
      Function(String) onChanged,
      ) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryBorderColor),
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.containerBackground,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: AppColors.lightGrey, fontSize: 14.sp),
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(icon, color: AppColors.icon, size: 18.sp),
        ],
      ),
    );
  }
}
