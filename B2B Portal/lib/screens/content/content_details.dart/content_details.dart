import 'package:flutter/material.dart';

class ContentDetailsPage extends StatelessWidget {
  const ContentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 2 / 3,
            child: Column(
              children: [
                _appbar(context, "Exploring the Night Sky", "Published"),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Media Attachments
                      SizedBox(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _mediaBox("https://placehold.co/600x400"),
                            const SizedBox(width: 8),
                            _mediaBox("https://placehold.co/600x400"),
                            const SizedBox(width: 8),
                            _mediaBox("https://placehold.co/600x400"),
                            const SizedBox(width: 8),
                            _moreMediaBox("+3 more"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Description
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                          "Vestibulum nec odio ipsum. Suspendisse cursus malesuada facilisis. "
                          "Nunc consectetur facilisis tincidunt. Proin a leo nisi. Vivamus non convallis est.",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),

                      Container(width: 1, color: Colors.grey[300]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 1 / 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Comments",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _commentItem(
                    "Alice",
                    "This content is really insightful!",
                    "2 hours ago",
                  ),
                  const SizedBox(height: 16),
                  _commentItem(
                    "Bob",
                    "Loved the breakdown of each concept.",
                    "5 hours ago",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mediaBox(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
    );
  }

  Widget _moreMediaBox(String label) {
    return Container(
      width: 80,
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300],
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _commentItem(String name, String comment, String timeAgo) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(comment, style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 4),
            Text(
              "$name • $timeAgo",
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }

  Widget _appbar(BuildContext context, String title, String status) => AppBar(
    title: Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
    ),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    ),
    actions: [
      Chip(label: Text(status), backgroundColor: Colors.green.shade100),
      const SizedBox(width: 8),
      const Icon(Icons.more_vert),
    ],
  );
}
