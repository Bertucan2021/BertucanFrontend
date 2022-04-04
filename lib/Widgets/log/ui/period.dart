import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../Local_database/sqlite.dart';

class LogPeriod extends StatefulWidget {
  static const routeName = '/logPeriod';
  const LogPeriod({Key? key}) : super(key: key);

  @override
  _LogPeriodState createState() => _LogPeriodState();
}


class _LogPeriodState extends State<LogPeriod> {
  late DateTime rangeStartDate ;
  late DateTime rangeEndDate;
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange){
       rangeStartDate = args.value.startDate;
       rangeEndDate = args.value.endDate;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(onTap: (){
          Navigator.pop(context);
        },child: const Icon(Icons.close,size: 25, color: Colors.black,)),
        actions:  [Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(onTap: () async{
            // TODO  Save to database
            // print('we got here');
            // print(rangeEndDate.difference(rangeStartDate).inDays);
            var fido =  LogPeriod2(
              id: 1,
              startDate: rangeStartDate,
              endDate: rangeEndDate,
            );

            await insertLog(fido);
            Navigator.pop(context);
          },child: const Center(child: Text('Submit', style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 18, color: Colors.pink),))),
        )],
      ),
      body: SafeArea(

        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.85,
              child: SfDateRangePicker(
enableMultiView: true,
                // allowViewNavigation: true,
                // toggleDaySelection: true,

                confirmText: 'Select',
                cancelText: 'Cancel',
                viewSpacing: 2,
                toggleDaySelection: true,
                showTodayButton: false,
                rangeTextStyle: const TextStyle(fontFamily: 'Poppins Bold', color: Colors.black),
                selectionTextStyle: const TextStyle(fontFamily: 'Poppins Bold'),
                // enablePastDates: false,
                // initialDisplayDate: DateTime.now(),
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                selectionShape: DateRangePickerSelectionShape.rectangle,
                // extendableRangeSelectionDirection: ExtendableRangeS electionDirection.both,
                navigationMode: DateRangePickerNavigationMode.scroll,
                navigationDirection: DateRangePickerNavigationDirection.vertical,
                  maxDate: DateTime.now(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
