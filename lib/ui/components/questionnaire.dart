import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import '../../shared/themes/app_theme.dart';

class Questionnaire extends StatefulWidget {
  final String question;
  final List<String> answers;
  final Function(List<int>) onAnswer;
  final bool isMultiple;
  const Questionnaire({
    Key? key,
    required this.question,
    required this.answers,
    required this.onAnswer,
    this.isMultiple = false,
  }) : super(key: key);

  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  List<int> answersIndexes = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LocalizedText(
            widget.question,
            style: AppTheme.titleStyle.copyWith(color: AppTheme.textBlack),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      if (!widget.isMultiple) {
                        setState(() {
                          answersIndexes.add(index);
                        });
                        widget.onAnswer(answersIndexes);
                      } else {
                        if (answersIndexes.contains(index)) {
                          setState(() {
                            answersIndexes.remove(index);
                          });
                        } else {
                          setState(() {
                            answersIndexes.add(index);
                          });
                        }
                      }
                    },
                    child: Container(
                      decoration: AppTheme.textFieldDecoration().copyWith(
                          color: answersIndexes.contains(index)
                              ? AppTheme.primaryColor
                              : AppTheme.boxGrey),
                      padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: LocalizedText(
                        widget.answers[index],
                        style: AppTheme.buttonLabelStyle.copyWith(
                          color: answersIndexes.contains(index)
                              ? AppTheme.white
                              : AppTheme.textGrey,
                        ),
                      ),
                    ));
              },
              itemCount: widget.answers.length,
            ),
          ),
          if (widget.isMultiple)
            Column(
              children: [
                const SizedBox(height: 10),
                RoundedButton(
                  text: "next",
                  onPressed: () {
                    widget.onAnswer(answersIndexes);
                  },
                ),
                const SizedBox(height: 60),
              ],
            )
        ],
      ),
    );
  }
}
