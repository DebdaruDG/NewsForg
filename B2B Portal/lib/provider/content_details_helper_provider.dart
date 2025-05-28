import 'package:flutter/material.dart';

import '../model/comment_model.dart';

class ContentDetailsAdditionalProvider with ChangeNotifier {
  bool _showComments = true;
  bool get showComments => _showComments;

  toggleCommentTab() {
    _showComments = !_showComments;
    notifyListeners();
  }

  List<CommentModel> _comments = [];
  List<CommentModel> get comments => _comments;

  setComments(List<CommentModel> value) {
    _comments = value;
    notifyListeners();
  }

  List<CommentModel> mockComments = [
    CommentModel(
      name: "Alice",
      comment:
          "The explanation of meteor showers was so engaging and easy to follow!",
      timeAgo: "2 hours ago",
    ),
    CommentModel(
      name: "Bob",
      comment:
          "Loved how you broke down the differences between constellations and asterisms.",
      timeAgo: "5 hours ago",
    ),
    CommentModel(
      name: "Clara",
      comment: "I wish there was a section on recommended stargazing apps too!",
      timeAgo: "1 day ago",
    ),
    CommentModel(
      name: "David",
      comment:
          "Really enjoyed the visuals—especially the annotated night sky images.",
      timeAgo: "2 days ago",
    ),
    CommentModel(
      name: "Eva",
      comment:
          "Informative read. Would be great to see a follow-up on telescope recommendations.",
      timeAgo: "3 days ago",
    ),
  ];
}
