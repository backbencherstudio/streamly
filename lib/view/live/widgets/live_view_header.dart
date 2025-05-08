import 'package:flutter/material.dart';
import '../../../model/live_view/live_view_model.dart';

class LiveViewHeader extends StatelessWidget {
  final LiveViewModel model;

  const LiveViewHeader({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 16,
      right: 16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                CircleAvatar(radius: 14, backgroundImage: NetworkImage(model.userImage)),
                const SizedBox(width: 8),
                Text(model.userName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                const SizedBox(width: 12),
                const Icon(Icons.remove_red_eye, color: Colors.white70, size: 16),
                const SizedBox(width: 4),
                Text(model.viewers, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(color: Colors.black45, shape: BoxShape.circle),
              child: const Icon(Icons.close, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
