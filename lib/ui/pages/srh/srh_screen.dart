import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/components/gbv_tile.dart';
import 'package:bertucanfrontend/ui/components/srh_title.dart';
import 'package:bertucanfrontend/ui/controllers/srh_controller.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SrhScreen extends StatefulWidget {
  SrhScreen({Key? key}) : super(key: key);

  @override
  State<SrhScreen> createState() => _SrhScreenState();
}

class _SrhScreenState extends State<SrhScreen> {
  SrhController controller = Get.find();

  @override
  void initState() {
    controller.getSrh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.creamyBackground,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const LocalizedText("srh_articles", style: AppTheme.titleStyle2),
            const SizedBox(height: 10),
            SearchTextField(
                hintText: 'search_article',
                controller: TextEditingController()),
            const SizedBox(height: 10),
            Obx(() {
              if (controller.status.value.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (controller.srhs.isEmpty) {
                  return LocalizedText("no_articles",
                      style: AppTheme.titleStyle2);
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.srhs.length,
                      itemBuilder: (context, index) {
                        return SrhTitle(
                          name: controller.srhs[index].title ?? "",
                          description:
                              controller.srhs[index].small_description ?? "",
                          onTap: () {
                            controller.selectSrh(controller.srhs[index]);
                          },
                        );
                      },
                    ),
                  );
                }
              }
            })
          ],
        ),
      ),
    );
  }
}
