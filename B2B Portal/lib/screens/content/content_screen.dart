import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsforg_b2b_portal/utils/color_palette.dart';

import '../../model/content_model.dart';
import '../../routes/routes_name.dart';
import '../../utils/widgets/data_table.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: DashboardColors.primaryWhite,
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main data table content
          GenericDataTable<ContentModel>(
            data: ContentItems.dummyContentList,
            columns: {
              'Title': (item) => item.title,
              'Author': (item) => item.author,
              'Created At': (item) => item.createdAt.toString(),
              'Email': (item) => item.email,

              'Mobile': (item) => item.mobileNumber,
            },
            onEdit: (item) => debugPrint('Edit ${item.title}'),
            onDelete: (item) => debugPrint('Delete ${item.title}'),
            onPublish: (item) => debugPrint('Publish ${item.title}'),
            onTapEachRow:
                (item) => context.pushNamed(AppScreen.contentDetails.name),
          ),
        ],
      ),
    );
  }
}
