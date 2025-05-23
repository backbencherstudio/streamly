import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteHeaderSection extends StatefulWidget {
  const FavoriteHeaderSection({super.key});
  @override
  State<FavoriteHeaderSection> createState() => _FavoriteHeaderSectionState();
}

class _FavoriteHeaderSectionState extends State<FavoriteHeaderSection> {
  final List<String> favoriteData = [
    'All Categories',
    'Movie',
    'TV Series',
    'Drama',
    'Action',
    'Comedy',
    'Documentary',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: favoriteData.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: GestureDetector(
              onTap: () {
                setState(() => selectedIndex = index);
              },
              child: CategoryChip(
                title: favoriteData[index],
                isSelected: isSelected,
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryChip({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 40.h,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF7A25BC) : Colors.transparent,
        border: Border.all(color: const Color(0xFF7A24BC)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF7A24BC),
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
