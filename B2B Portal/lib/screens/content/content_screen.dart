import 'package:flutter/material.dart';

import '../../model/content_model.dart';
import '../../utils/widgets/data_table.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
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
              ),
            ],
          );
        },
      ),
    );
  }
}
