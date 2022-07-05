import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportGbvPage extends StatelessWidget {
  const ReportGbvPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.creamyBackground,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
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
                            child: LocalizedText("back",
                                style: AppTheme.titleStyle3)),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 26,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                              "https://api.lorem.space/image/face?hash=92310"),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Francisco Fisher",
                          style: AppTheme.titleStyle
                              .copyWith(color: AppTheme.textBlack),
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    LocalizedText(
                      "report_abuse",
                      style: AppTheme.titleStyle
                          .copyWith(color: AppTheme.textBlack),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: AppTheme.purpleBoxDecoration(),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 30),
                      child: const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "report_abuse_hint",
                            hintStyle: AppTheme.hintTextStyle),
                        maxLines: 8,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      decoration: AppTheme.purpleBoxDecoration(),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const LocalizedText(
                            "upload_file",
                            style: AppTheme.hintTextStyle,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.upload_rounded,
                              color: AppTheme.hintGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: RoundedButton(text: "send", onPressed: () {}),
                )
              ]),
        ));
  }
}
