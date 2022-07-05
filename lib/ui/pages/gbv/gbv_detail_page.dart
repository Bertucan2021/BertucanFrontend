import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GbvDetailPage extends StatelessWidget {
  const GbvDetailPage({Key? key}) : super(key: key);

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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 10),
                          Image.network(
                            'https://www.bertucan.com/wp-content/uploads/2020/01/twitter.png',
                            height: 40,
                          ),
                          Image.network(
                            'https://www.bertucan.com/wp-content/uploads/2020/01/instagram.png',
                            height: 40,
                          ),
                          Image.network(
                            'https://www.bertucan.com/wp-content/uploads/2020/01/facebook.png',
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const Text(
                        "I need a designer for my new website. The project is just at the beginning and I need wireframes before I start coding the website. I only want wireframes and I don’t want prototype or UI design.",
                        textAlign: TextAlign.center,
                        maxLines: 5,
                        style: AppTheme.articleTextStyle,
                      ),
                    ),
                  ],
                ),
                RoundedButton(text: 'view_location', onPressed: () {}),
                const SizedBox(height: 20),
                RoundedButton(text: 'report_abuse', onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
