import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:streamly/themes/color.dart';

class FavoriteCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const FavoriteCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/managePlaneScreen');
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
              top: 9,
              left: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: AppColors.textPurple,
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
