import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GbvTile extends StatelessWidget {
  final String name;
  final String description;
  final String? imageUrl;
  const GbvTile({
    Key? key,
    required this.name,
    required this.description,
    this.imageUrl,
  }) : super(key: key);
//SrhScreen
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                  imageUrl ?? "https://api.lorem.space/image/face?hash=92310"),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTheme.titleStyle2.copyWith(fontSize: 16)),
                Text(description,
                    style: AppTheme.greySubtitleStyle
                        .copyWith(fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            Get.toNamed(Routes.gbvDetailPage);
          },
          icon: const Icon(
            Icons.chevron_right,
            color: AppTheme.primaryColor,
            size: 30,
          ),
        ),
      ]),
    );
  }
}
