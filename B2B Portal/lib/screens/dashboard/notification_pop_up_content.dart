import 'package:flutter/material.dart';
import '../../utils/textstyles_constant.dart';

class NotificationPopupContent extends StatefulWidget {
  const NotificationPopupContent({super.key});

  @override
  State<NotificationPopupContent> createState() =>
      _NotificationPopupContentState();
}

class _NotificationPopupContentState extends State<NotificationPopupContent> {
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Article Approved",
      "subtitle":
          "Your article *‘Future of AI in Journalism’* was approved by Chief Editor.",
      "time": "Today 11:00 AM",
      "type": "approval",
      "isRead": false,
    },
    {
      "title": "Breaking News File Shared",
      "subtitle":
          "You received *breaking-news-clip.mp4* in *Politics* section.",
      "fileName": "breaking-news-clip.mp4",
      "fileDate": "May 10, 2025",
      "fileSize": "12.4 MB",
      "time": "Yesterday 3:45 PM",
      "type": "file",
      "isRead": false,
    },
    {
      "title": "New Follower",
      "subtitle": "*Jane Thomas*, Senior Editor, started following your work.",
      "time": "May 10, 10:30 AM",
      "type": "follow",
      "isRead": true,
    },
    {
      "title": "Collaboration Invite",
      "subtitle": "You’ve been invited to join *Election 2025 Report* project.",
      "time": "May 9, 2:00 PM",
      "type": "invite",
      "isRead": true,
      "actionButtons": ["Decline", "Accept"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final background = isDark ? Colors.grey.shade900 : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black87;
    final borderColor = isDark ? Colors.grey.shade700 : Colors.grey.shade300;

    return Container(
      padding: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Notifications",
                  style: DashboardTextStyles.amountMedium.copyWith(
                    color: textColor,
                  ),
                ),
                const Spacer(),
                Text(
                  "(${notifications.length})",
                  style: DashboardTextStyles.primaryText400,
                ),
                const SizedBox(width: 6),
                const Icon(Icons.settings, size: 18),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.height * 0.4,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: notifications.length,
                separatorBuilder:
                    (_, __) => Divider(thickness: 0.4, color: borderColor),
                itemBuilder: (context, index) {
                  final item = notifications[index];
                  return _notificationTile(
                    context,
                    item,
                    textColor,
                    borderColor,
                    isDark,
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {},
              child: const Text("All notifications"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _notificationTile(
    BuildContext context,
    Map<String, dynamic> item,
    Color textColor,
    Color borderColor,
    bool isDark,
  ) {
    IconData icon;
    switch (item["type"]) {
      case "approval":
        icon = Icons.verified;
        break;
      case "file":
        icon = Icons.insert_drive_file;
        break;
      case "follow":
        icon = Icons.person_add;
        break;
      case "invite":
        icon = Icons.group_add;
        break;
      default:
        icon = Icons.notifications;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 24,
            color: isDark ? Colors.lightBlue[200] : Colors.blueAccent,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["title"],
                  style: DashboardTextStyles.primaryText500.copyWith(
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item["subtitle"],
                  style: DashboardTextStyles.primaryText400,
                ),
                if (item["fileName"] != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(6),
                      color: isDark ? Colors.black26 : Colors.grey.shade100,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.file_present, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            item["fileName"],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          item["fileSize"],
                          style: DashboardTextStyles.amountMedium,
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 6),
                Text(item["time"], style: DashboardTextStyles.amountMedium),
                if (item["actionButtons"] != null)
                  Row(
                    children: List.generate(item["actionButtons"].length, (
                      btnIdx,
                    ) {
                      final label = item["actionButtons"][btnIdx];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8, top: 6),
                        child: TextButton(onPressed: () {}, child: Text(label)),
                      );
                    }),
                  ),
              ],
            ),
          ),
          if (!item["isRead"])
            const Icon(Icons.circle, size: 8, color: Colors.blueAccent),
        ],
      ),
    );
  }
}
