import 'package:flutter/material.dart';

import '../../model/user_model.dart';
import '../../utils/color_palette.dart';
import '../../utils/widgets/data_table.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
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
          GenericDataTable<UserModel>(
            data: UserData.dummyContentList,
            columns: {
              'User Id': (item) => item.id,
              'Full Name': (item) => item.fullName,
              'Created At': (item) => item.createdAt.toIso8601String(),
              'Email': (item) => item.email,
              'Mobile': (item) => item.role,
              'Created On': (item) => item.createdAt.toIso8601String(),
            },
            onEdit: (item) => debugPrint('Edit ${item.id}'),
            onDelete: (item) => debugPrint('Delete ${item.id}'),
            onPublish: (item) => debugPrint('Publish ${item.id}'),
            onTapEachRow: (item) {},
            // context.pushNamed(AppScreen.contentDetails.name),
          ),
        ],
      ),
    );
  }
}
