import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streamly/config/icons/icons.dart';

class LiveAppBar extends StatelessWidget {
  const LiveAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
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
                SizedBox(
                  width: 8.w,
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Color(0xff4B3736), shape: BoxShape.circle),
                  child: Image.asset(AppIcons.voice, width: 20, height: 20),
                ),
              ],
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xff19161D)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
