import 'package:flutter/material.dart';

class LiveViewInputBar extends StatelessWidget {
  final TextEditingController commentController;
  final Function(String) onSubmit;
  final VoidCallback onHeartTap;

  const LiveViewInputBar({
    Key? key,
    required this.commentController,
    required this.onSubmit,
    required this.onHeartTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 12,
      right: 12,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: commentController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Add a comment",
                hintStyle: const TextStyle(color: Colors.white60),
                filled: true,
                fillColor: Colors.black45,
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: onSubmit,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onHeartTap,
            child: const Icon(Icons.favorite, color: Colors.red, size: 26),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => onSubmit(commentController.text),
            child: const Icon(Icons.send, color: Colors.white, size: 26),
          ),
        ],
      ),
    );
  }
}
