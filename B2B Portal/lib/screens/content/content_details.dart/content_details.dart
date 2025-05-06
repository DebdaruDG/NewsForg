import 'package:flutter/material.dart';

class ContentDetailsPage extends StatelessWidget {
  const ContentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "Exploring the Night Sky",
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Chip(
            label: const Text("Published"),
            backgroundColor: Colors.green.shade100,
          ),
          const SizedBox(width: 8),
          const Icon(Icons.more_vert),
          const SizedBox(width: 16),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              // Content Section (2/3)
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: constraints.maxHeight,
                    child: ListView(
                      children: [
                        // Media Attachments
                        SizedBox(
                          height: 80,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _mediaBox("https://via.placeholder.com/80"),
                              const SizedBox(width: 8),
                              _mediaBox("https://via.placeholder.com/80"),
                              const SizedBox(width: 8),
                              _mediaBox("https://via.placeholder.com/80"),
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
                      ],
                    ),
                  ),
                ),
              ),

              // Divider
              Container(width: 1, color: Colors.grey[300]),

              // Comments Section (1/3)
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: constraints.maxHeight,
                    child: ListView(
                      children: [
                        Text(
                          "Comments",
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
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
              ),
            ],
          );
        },
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
        Expanded(
          child: Column(
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
        ),
      ],
    );
  }
}
