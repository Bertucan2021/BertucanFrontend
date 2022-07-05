import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/components/gbv_tile.dart';
import 'package:bertucanfrontend/ui/components/srh_title.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/search_textfield.dart';
import 'package:flutter/material.dart';

class SrhScreen extends StatelessWidget {
  const SrhScreen({Key? key}) : super(key: key);

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
            Expanded(
                child: ListView(
              children: const [
                SrhTitle(
                  name: 'remote_office_not_required',
                  description: 'Jason Field',
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}