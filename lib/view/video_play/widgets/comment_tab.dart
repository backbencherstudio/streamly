import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../block/comment/comment_bloc.dart';
import '../../../model/comment/comment.dart';

class CommentTab extends StatefulWidget {
  const CommentTab({Key? key}) : super(key: key);

  @override
  State<CommentTab> createState() => _CommentTabState();
}

class _CommentTabState extends State<CommentTab> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CommentBloc>().add(LoadComments());
  }

  Widget _buildReply(Comment reply) {
    return Padding(
      padding: EdgeInsets.only(left: 44.w, top: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white, size: 18.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(reply.user, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13.sp)),
                    SizedBox(width: 8.w),
                    Text(reply.time, style: TextStyle(color: Colors.grey, fontSize: 11.sp)),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(reply.text, style: TextStyle(color: Colors.white, fontSize: 13.sp)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComment(Comment comment) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18.r,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white, size: 20.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(comment.user, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13.sp)),
                        SizedBox(width: 8.w),
                        Text(comment.time, style: TextStyle(color: Colors.grey, fontSize: 11.sp)),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(comment.text, style: TextStyle(color: Colors.white, fontSize: 13.sp)),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => context.read<CommentBloc>().add(LikeComment(comment.id)),
                          child: Row(
                            children: [
                              Icon(Icons.thumb_up_alt_outlined, color: Colors.grey, size: 16.sp),
                              SizedBox(width: 4.w),
                              Text('${comment.likes}', style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                            ],
                          ),
                        ),
                        SizedBox(width: 16.w),
                        GestureDetector(
                          onTap: () => context.read<CommentBloc>().add(DislikeComment(comment.id)),
                          child: Row(
                            children: [
                              Icon(Icons.thumb_down_alt_outlined, color: Colors.grey, size: 16.sp),
                              SizedBox(width: 4.w),
                              Text('${comment.dislikes}', style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                            ],
                          ),
                        ),
                        SizedBox(width: 16.w),
                        GestureDetector(
                          onTap: () {
                            final replyController = TextEditingController();
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: const Color(0xFF0B0617),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12.r))),
                              builder: (_) {
                                return Padding(
                                  padding: EdgeInsets.all(16.w),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: replyController,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          hintText: 'Write a reply...',
                                          hintStyle: TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: const Color(0xFF1A1A2E),
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: BorderSide.none),
                                        ),
                                      ),
                                      SizedBox(height: 12.h),
                                      ElevatedButton(
                                        onPressed: () {
                                          final replyText = replyController.text.trim();
                                          if (replyText.isNotEmpty) {
                                            context.read<CommentBloc>().add(AddReply(comment.id, replyText));
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: const Text('Reply'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Text('Reply', style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          ...comment.replies.map(_buildReply).toList(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0617),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CommentBloc, CommentState>(
              builder: (context, state) {
                if (state is CommentsLoaded) {
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    itemCount: state.comments.length,
                    itemBuilder: (context, index) => _buildComment(state.comments[index]),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: SafeArea(
        child: Transform.translate(
          offset: Offset(0,50),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            color: const Color(0xFF1A1A2E),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16.r,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white, size: 18.sp),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    decoration: InputDecoration(
                      hintText: 'Add a public comment...',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 13.sp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    final text = _controller.text.trim();
                    if (text.isNotEmpty) {
                      context.read<CommentBloc>().add(AddComment(text));
                      _controller.clear();
                    }
                  },
                  child: Text('Comment', style: TextStyle(color: Colors.purple, fontSize: 14.sp)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
