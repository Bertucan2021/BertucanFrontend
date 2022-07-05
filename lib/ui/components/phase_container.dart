import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PhaseContainer extends StatelessWidget {
  final DateTime date;
  const PhaseContainer({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: AppTheme.orangeBoxDecoration(),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        CircularPercentIndicator(
          radius: 60.0,
          lineWidth: 7.0,
          backgroundColor: Colors.white38,
          rotateLinearGradient: true,
          animateFromLastPercent: true,
          startAngle: 180,
          percent: .6,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 4,
              ),
              const LocalizedText("day",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTheme.greySubtitleStyle),
              Text(DateFormat.d().format(date), style: AppTheme.titleStyle5),
            ],
          ),
          progressColor: Colors.white,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LocalizedText('luteal_phase',
                style: AppTheme.titleStyle2.copyWith(color: AppTheme.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('chance_of_pregnancy: ',
                    style: AppTheme.greySubtitleStyle),
                Text(
                  "low",
                  style: AppTheme.titleStyle4,
                )
              ],
            )
          ],
        ),
      ]),
    );
  }
}
