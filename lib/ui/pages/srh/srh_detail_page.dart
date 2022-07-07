import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SrhDetailPage extends StatelessWidget {
  const SrhDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 40,
                  ),
                ),
                const LocalizedText("back", style: AppTheme.titleStyle3),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 10),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              margin: const EdgeInsets.all(10),
                              color: AppTheme.primaryColor,
                              child: Column(
                                children: [
                                  const LocalizedText(
                                      "you_are_in_charge_of_this_project",
                                      style: AppTheme.titleStyle4),
                                  const SizedBox(width: 10, height: 5),
                                  const LocalizedText("deadline_28/03/2020",
                                      style: AppTheme.greySubtitleStyle),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                                "https://api.lorem.space/image/face?hash=92310"),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Francisco Fisher",
                                  style: AppTheme.titleStyle2),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Posted 8 days ago',
                            style: AppTheme.articleTextStyle,
                            textAlign: TextAlign.left,
                          )),
                      const SizedBox(height: 20),
                      Container(
                        child: const Text(
                          "I need a designer for my new website. The project is just at the beginning and I need wireframes before I start coding the website. I only want wireframes and I don’t want prototype or UI design.",
                          textAlign: TextAlign.left,
                          maxLines: 5,
                          style: AppTheme.articleTextStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    child: const Text(
                      "I need a designer for my new website. The project is just at the beginning and I need wireframes before I start coding the website. I only want wireframes and I don’t want prototype or UI design.",
                      textAlign: TextAlign.left,
                      maxLines: 5,
                      style: AppTheme.articleTextStyle,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
