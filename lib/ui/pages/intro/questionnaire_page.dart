import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/components/questionnaire.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionnairePage extends StatefulWidget {
  QuestionnairePage({Key? key}) : super(key: key);

  @override
  State<QuestionnairePage> createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 35),
        Row(
          children: [
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width * 0.82,
              lineHeight: 3.0,
              percent: 0.5,
              backgroundColor: AppTheme.hintGrey,
              progressColor: AppTheme.textBlack,
              barRadius: const Radius.circular(5),
            ),
            TextButton(
                onPressed: () {
                  _changeQuestion(_currentIndex + 1);
                },
                child: LocalizedText(
                  "skip",
                  style: AppTheme.greySubtitleStyle
                      .copyWith(color: AppTheme.textBlack),
                ))
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Expanded(
          child: PageView(
            controller: _pageController,
            children: [
              Questionnaire(
                question:
                    "Is your menstrual cycle regular(varies by no more than 7 days)?",
                answers: [
                  "My cycle is  regular",
                  "My cycle is  irregular",
                  "I don’t know"
                ],
                onAnswer: (answerIndexs) {
                  _changeQuestion(1);
                },
              ),
              Questionnaire(
                question:
                    "Do you experiance discomfort due to any of the following?",
                answers: [
                  "Painful menstrual cramps",
                  "PMS symptoms",
                  "Unusual discharge"
                ],
                isMultiple: true,
                onAnswer: (answerIndexs) {
                  // _changeQuestion(2);
                  Get.toNamed(Routes.homePage);
                },
              ),
            ],
          ),
        ),
      ],
    ));
  }

  void _changeQuestion(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }
}
