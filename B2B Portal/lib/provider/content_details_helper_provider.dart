import 'package:flutter/material.dart';

class ContentDetailsAdditionalProvider with ChangeNotifier {
  bool _showComments = true;
  bool get showComments => _showComments;

  toggleCommentTab() {
    _showComments = !_showComments;
    notifyListeners();
  }
}
