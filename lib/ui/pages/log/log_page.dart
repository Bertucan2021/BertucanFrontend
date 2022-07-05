import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class LogPage extends StatelessWidget {
   LogPage({Key? key}) : super(key: key);
  final DateRangePickerController _controller = DateRangePickerController();
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
          child: Column(
           children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'today',
                      style:AppTheme.normalTextStyle.copyWith(color: AppTheme.primaryColor),
                    ),
                    
                  ],
                ),
              ),
            Expanded(
             child: SfDateRangePicker(
              todayHighlightColor: AppTheme.primaryColor,
              startRangeSelectionColor: AppTheme.primaryColor,
              endRangeSelectionColor: AppTheme.primaryColor,
              rangeSelectionColor: AppTheme.lightPink,
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.range,
              enableMultiView: true,
              navigationDirection: DateRangePickerNavigationDirection.vertical,
              ),
         ),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
              TextButton(
                onPressed: () {
              _controller.selectedDate = null;

                },
                child: Text("cancel", style: AppTheme.normalTextStyle.copyWith(color: AppTheme.primaryColor),)),
              TextButton(
               onPressed: () {
                selectedDate = _controller.selectedDate;

               },
              child: Text("save", style: AppTheme.normalTextStyle.copyWith(color: AppTheme.primaryColor)))
              ],
             ),
           
       ],
        ),
      ));
  }
}
