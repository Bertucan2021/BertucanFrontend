import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SrhTitle extends StatelessWidget {
  final String name;
  final String description;
  final String? imageUrl;
  const SrhTitle({
    Key? key,
    required this.name,
    required this.description,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.srhDetailPage),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.all(10),
        color: Colors.white,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(       
            children: [
            Image.asset(imageUrl ?? 'assets/srh_img.png', height: 107, width: 65,),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTheme.titleStyle2.copyWith(fontSize: 16)),
                  const SizedBox(height: 50),     
                  Text(description,
                      style: AppTheme.greySubtitleStyle
                          .copyWith(fontWeight: FontWeight.w400)),
                ],
              ),
            ],
          ), 
        ]),
      ),
    );
  }
}
