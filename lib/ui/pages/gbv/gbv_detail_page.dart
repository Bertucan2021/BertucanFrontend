import 'package:bertucanfrontend/shared/routes/app_routes.dart';
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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 10),
                const Center(
                    child: LocalizedText("back", style: AppTheme.titleStyle3)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Column(
                  children: [
                     Container(
                            width:MediaQuery.of(context).size.width ,
                            height: MediaQuery.of(context).size.height * 0.1,
                            padding: const EdgeInsets.symmetric(horizontal:10, vertical: 10),
                            margin: const EdgeInsets.all(10),
                            color: AppTheme.primaryColor,
                            child: Column(
                              children: [
                                const SizedBox( height:10  ),
                                const LocalizedText("you_are_in_charge_of_this_project", style: AppTheme.titleStyle2),
                                const SizedBox( height:5  ),
                                const LocalizedText("deadline_28/03/2020", style: AppTheme.greySubtitleStyle),
                              ],
                            ),
                          ),    
                   const SizedBox(height: 10),
                    SizedBox(             
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/twitter_logo.png',
                            height: 40,
                          ),
                          Image.asset(
                            'assets/instagram_logo.png',
                            height: 40,
                          ),
                          Image.asset(
                            'assets/facebook_logo.png',
                            height: 40,

                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
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
                Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    RoundedButton(text: 'view_location', onPressed: () {}),
                    const SizedBox(height: 40),
                    RoundedButton(
                        text: 'report_abuse',
                        onPressed: () {
                          Get.toNamed(Routes.reportGbvPage);
                        }),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
