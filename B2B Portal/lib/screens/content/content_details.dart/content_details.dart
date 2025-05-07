import 'package:flutter/material.dart';
import 'package:newsforg_b2b_portal/utils/textstyles_constant.dart';

import '../../../utils/color_palette.dart';
import '../../../utils/widgets/generic_pop_up.dart';

class ContentDetailsPage extends StatelessWidget {
  const ContentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey _popupIconKey = GlobalKey();

    return Container(
      color: Colors.grey[100],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 4 / 5,
              child: Column(
                children: [
                  _appbar(
                    context,
                    "Exploring the Night Sky",
                    "Published",
                    popUpKey: _popupIconKey,
                  ),
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
                              _mediaBox("assets/images/content_img_01.jpg"),
                              const SizedBox(width: 8),
                              _mediaBox("assets/images/content_img_02.jpg"),
                              const SizedBox(width: 8),
                              _mediaBox("assets/images/content_img_03.jpg"),
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
                ],
              ),
            ),
          ),
          Container(width: 1, color: Colors.grey[300]),
          SizedBox(
            width: MediaQuery.of(context).size.width * 1 / 5,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
      child: Image.asset(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
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

  Widget _appbar(
    BuildContext context,
    String title,
    String status, {
    GlobalKey<State<StatefulWidget>>? popUpKey,
  }) => PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: Container(
      decoration: BoxDecoration(
        color: DashboardColors.primaryWhite,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        actionsPadding: const EdgeInsets.all(6),
        elevation: 0,
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
          if (popUpKey != null)
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                key: popUpKey,
                onTap:
                    () => GenericPopupMenu.show(
                      context: context,
                      iconKey: popUpKey,
                      contentWidgets: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Edit",
                            style: DashboardTextStyles.primaryText400,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Change Status",
                            style: DashboardTextStyles.primaryText400,
                          ),
                        ),
                      ],
                    ),
                child: const Icon(Icons.more_vert),
              ),
            ),
        ],
      ),
    ),
  );
}
