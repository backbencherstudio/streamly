import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double? rating;
  final String? badge;
  final VoidCallback? onTap;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.rating,
    this.badge,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
          ),
          if (badge != null)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(badge!, style: const TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ),
          Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
