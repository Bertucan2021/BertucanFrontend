import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/widgets/image_holder.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({Key? key}) : super(key: key);
  final AuthController _authController = Get.find();

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
                        _authController.isEthio? const LocalizedText(
                          "BertuCAN ስለ ወሲባዊ እና የስነ ተዋልዶ ጤና መረጃ ልጃገረዶችን እና ሴቶችን ለማበረታታት ያለመ የሞባይል መተግበሪያ ነው። አፕሊኬሽኑ ሴቶች የወር አበባ ጤንነታቸውን በወር አበባ ወቅት መከታተል እንዲችሉ ያስችላቸዋል። በተጨማሪም፣ አፕሊኬሽኑ በጾታዊ እና ስነ-ተዋልዶ ጤና እና መብቶች እና በስርዓተ-ፆታ ላይ የተመሰረተ ጥቃትን በተመለከተ አስፈላጊ አገልግሎቶችን መረጃ ይሰጣል።",
                          style: AppTheme.articleTextStyle,
                          textAlign: TextAlign.justify,
                        ):const LocalizedText(
                          "BertuCAN is a mobile application that aims to empower girls and women through information about sexual and reproductive health. The application allows women to manage their menstrual health through a period tracking calendar. In addition, the application provides information on sexual and reproductive health and rights and essential services in the incidence  of Gender Based Violence.",
                          style: AppTheme.articleTextStyle,
                          textAlign: TextAlign.justify,
                        ),
                        // SizedBox(height: height*0.03),
                        // LocalizedText("Our Goals",
                        //     style: AppTheme.titleStyle4
                        //         .copyWith(fontSize: 32)),
                        // SizedBox(height: height*0.02,),
                        // const LocalizedText(
                        //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        //   style: AppTheme.articleTextStyle,
                        //   textAlign: TextAlign.justify,
                        // ),
                        // SizedBox(height: height*0.03),
                        // LocalizedText("Contacts",
                        //     style: AppTheme.titleStyle4
                        //         .copyWith(fontSize: 32)),
                        // SizedBox(height: height*0.02,),
                        // const LocalizedText(
                        //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        //   style: AppTheme.articleTextStyle,
                        //   textAlign: TextAlign.justify,
                        // ),
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
