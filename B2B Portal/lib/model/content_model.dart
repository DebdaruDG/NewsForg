class ContentModel {
  final String title;
  final String author;
  final DateTime createdAt;
  final String email;
  final String mobileNumber;

  ContentModel({
    required this.title,
    required this.author,
    required this.createdAt,
    required this.email,
    required this.mobileNumber,
  });
}

class ContentItems {
  static List<ContentModel> dummyContentList = [
    ContentModel(
      title: 'Breaking News: Flutter 4 Released',
      author: 'Deb',
      createdAt: DateTime(2025, 5, 6),
      email: 'deb@example.com',
      mobileNumber: '+8801234567890',
    ),
    ContentModel(
      title: 'Tech Weekly Roundup',
      author: 'Sam',
      createdAt: DateTime(2025, 4, 28),
      email: 'sam@example.com',
      mobileNumber: '+8801987654321',
    ),
    ContentModel(
      title: 'Breaking News: Flutter 4 Released',
      author: 'Deb',
      createdAt: DateTime(2025, 5, 6),
      email: 'deb@example.com',
      mobileNumber: '+8801234567890',
    ),
    ContentModel(
      title: 'Tech Weekly Roundup',
      author: 'Sam',
      createdAt: DateTime(2025, 4, 28),
      email: 'sam@example.com',
      mobileNumber: '+8801987654321',
    ),
    ContentModel(
      title: 'Breaking News: Flutter 4 Released',
      author: 'Deb',
      createdAt: DateTime(2025, 5, 6),
      email: 'deb@example.com',
      mobileNumber: '+8801234567890',
    ),
    ContentModel(
      title: 'Tech Weekly Roundup',
      author: 'Sam',
      createdAt: DateTime(2025, 4, 28),
      email: 'sam@example.com',
      mobileNumber: '+8801987654321',
    ),
  ];
}
