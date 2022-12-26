import 'package:abushakir/abushakir.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SingleCycleItem extends StatelessWidget {
  final MonthlyMensturationModel data;
  final AuthController _authController = Get.find();

  SingleCycleItem({Key? key, required this.data}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ETC selectedETCStartDate =
        ETC(year: data.startDate.year, month: data.startDate.month, day: data.startDate.day);
    ETC selectedETCEndDate =
        ETC(year: data.endDate.year, month: data.endDate.month, day: data.endDate.day);
    ETC highestPregrnanceDate = ETC(year: data.pregnancyDate!.year, month: data.pregnancyDate!.month, day: data.pregnancyDate!.day);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: AppTheme.whiteBoxDecoration(),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocalizedText(
                  "period_date",
                  style: AppTheme.titleStyle4.copyWith(color: Colors.black),
                ),
                SizedBox(width: 2),
                _authController.isEthio?
                  Text(
                      " ${selectedETCStartDate.monthName} ${selectedETCStartDate.day}, ${selectedETCStartDate.year}  - ${selectedETCEndDate.monthName} ${selectedETCEndDate.day}, ${selectedETCEndDate.year}",
                    )
                :
                Text(
                    '${DateFormat.yMMMEd().format(data.startDate)}-${DateFormat.yMMMEd().format(data.endDate)}',
                    style: AppTheme.articleTextStyle
                        .copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocalizedText(
                  "period_length",
                  style: AppTheme.titleStyle4.copyWith(color: Colors.black),
                ),
                SizedBox(width: 10),
                Text('${data.endDate.difference(data.startDate).inDays}',
                    style: AppTheme.articleTextStyle
                        .copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            data.pregnancyDate != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LocalizedText(
                        "highest_pregnancy_chance",
                        style:
                            AppTheme.titleStyle4.copyWith(color: Colors.black),
                      ),
                      SizedBox(width: 2),
                      _authController.isEthio?
                      Text(
                      " ${highestPregrnanceDate.monthName} ${highestPregrnanceDate.day}, ${highestPregrnanceDate.year}",
                    ):
                      Text('${DateFormat.yMMMEd().format(data.pregnancyDate!)}',
                          style: AppTheme.articleTextStyle
                              .copyWith(fontWeight: FontWeight.w500)),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
