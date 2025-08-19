import 'package:flutter/material.dart';

import '../../../data/model/live_view/live_view_model.dart';

class LiveViewComments extends StatelessWidget {
  final List<LiveComment> comments;
  final ScrollController commentScrollController;

  const LiveViewComments({Key? key, required this.comments, required this.commentScrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 110,
      left: 12,
      right: 80,
      child: SizedBox(
        height: 180,
        child: ListView.builder(
          controller: commentScrollController,
          padding: EdgeInsets.zero,
          itemCount: comments.length,
          itemBuilder: (context, index) {
            final comment = comments[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage("https://i.imgur.com/2yaf2wb.jpg"),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${comment.name}: ',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: comment.message,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
