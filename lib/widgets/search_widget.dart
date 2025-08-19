import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/icons/icons.dart';
import '../core/routes/routes.dart';


class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      onFieldSubmitted: (value) {
        if (value.trim().isNotEmpty) {
          context.push(RoutesName.searchResult);
        }
      },
      decoration: InputDecoration(
        contentPadding:
        const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        filled: true,
        fillColor: const Color(0xff0E0A05),
        hintText: "Search",
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(AppIcons.search, width: 20, height: 20),
        ),
        suffixIcon: SizedBox(
          width: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Container(
                  height: 23,
                  width: 2,
                  color: Color(0xff9F9D9B),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Color(0xff554444), shape: BoxShape.circle),
                child: Image.asset(AppIcons.voice, width: 20, height: 20),
              ),
            ],
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(width: 2, color: Color(0xff221E19)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(width: 2, color: Color(0xff221E19)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(width: 2, color: Color(0xff221E19)),
        ),
      ),
    );
  }
}

