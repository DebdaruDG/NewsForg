import 'package:flutter/material.dart';
import 'package:newsforg_b2b_portal/utils/textstyles_constant.dart';
import 'package:provider/provider.dart';

import '../../../model/comment_model.dart';
import '../../../provider/content_details_helper_provider.dart';
import '../../../utils/article_richtext_editor/richtext_editor_for_article.dart';
import '../../../utils/color_palette.dart';
import '../../../utils/icon_constants.dart';
import '../../../utils/widgets/generic_pop_up.dart';

class ContentDetailsPage extends StatelessWidget {
  const ContentDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey popupIconKey = GlobalKey();

    return Consumer<ContentDetailsAdditionalProvider>(
      builder:
          (_, provider, ___) => Container(
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
                          popUpKey: popupIconKey,
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
                                    _mediaBox(
                                      "assets/images/content_img_01.jpg",
                                    ),
                                    const SizedBox(width: 8),
                                    _mediaBox(
                                      "assets/images/content_img_02.jpg",
                                    ),
                                    const SizedBox(width: 8),
                                    _mediaBox(
                                      "assets/images/content_img_03.jpg",
                                    ),
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
                                child: ArticleEditor(),
                                // const Text(
                                //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                                //   "Vestibulum nec odio ipsum. Suspendisse cursus malesuada facilisis. "
                                //   "Nunc consectetur facilisis tincidunt. Proin a leo nisi. Vivamus non convallis est.",
                                //   style: TextStyle(fontSize: 16),
                                // ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(width: 1, color: Colors.grey[300]),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 350),
                  width:
                      MediaQuery.of(context).size.width *
                      (provider.showComments ? 0.225 : 0.075),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (provider.showComments != true)
                            IconButton(
                              tooltip:
                                  provider.showComments
                                      ? 'Hide Comments'
                                      : 'Show Comments',
                              icon: Icon(
                                provider.showComments
                                    ? Icons.comment_bank
                                    : DashboardMaterialDesignIcons.comment,
                              ),
                              onPressed: () => provider.toggleCommentTab(),
                            ),
                          if (provider.showComments) ...[
                            Row(
                              children: [
                                IconButton(
                                  tooltip: 'Hide Comments',
                                  icon: Icon(DashboardRemixIcons.arrowIconLeft),
                                  onPressed: () => provider.toggleCommentTab(),
                                ),
                                Text(
                                  "Comments",
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            ListView.builder(
                              itemCount: provider.mockComments.length,
                              shrinkWrap: true,
                              itemBuilder:
                                  (context, index) => _commentItem(
                                    model: provider.mockComments[index],
                                  ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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

  Widget _commentItem({required CommentModel model}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
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
                Text(
                  model.comment,
                  style: DashboardTextStyles.amountMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${model.name} • ${model.timeAgo}",
                  style: DashboardTextStyles.amountMedium.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(4),
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
