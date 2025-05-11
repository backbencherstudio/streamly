import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/routes/routes.dart';
import 'package:streamly/themes/color.dart';

class FavoriteCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const FavoriteCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RoutesName.contentDetailScreen);
      },
      child: Container(
        height: 240,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(data["imageUrl"]),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Color(0xff7A25BC),
                ),
                child: Text(
                  data["rating"].toString(),
                  style: TextStyle(color: AppColors.textPrimary),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
