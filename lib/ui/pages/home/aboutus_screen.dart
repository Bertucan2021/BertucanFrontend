import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/image_holder.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
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
                      color: Colors.grey,
                    ),
                  ),
                  Center(
                      child: LocalizedText("back",
                          style:
                              AppTheme.hintTextStyle.copyWith(fontSize: 20))),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            width: width,
                            height: height * 0.15,
                            color: AppTheme.primaryColor,
                            child: Column(
                              children: [
                                const SizedBox(height: 30),
                                LocalizedText("BertuCAN",
                                    style: AppTheme.titleStyle4.copyWith(
                                        color: Colors.white, fontSize: 46)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: height*0.03),
                    child: Column(
                      children: [
                        LocalizedText("About BertuCAN",
                            style: AppTheme.titleStyle4
                                .copyWith(fontSize: 32)),
                        SizedBox(height: height*0.02,),
                        const LocalizedText(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          style: AppTheme.articleTextStyle,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: height*0.03),
                        LocalizedText("Our Goals",
                            style: AppTheme.titleStyle4
                                .copyWith(fontSize: 32)),
                        SizedBox(height: height*0.02,),
                        const LocalizedText(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          style: AppTheme.articleTextStyle,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: height*0.03),
                        LocalizedText("Contacts",
                            style: AppTheme.titleStyle4
                                .copyWith(fontSize: 32)),
                        SizedBox(height: height*0.02,),
                        const LocalizedText(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          style: AppTheme.articleTextStyle,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
