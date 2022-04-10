import 'dart:io';
import 'package:bertucanfrontend/Data/report.dart';
import 'package:bertucanfrontend/Repositories/report_repository.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_report_bloc.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_report_event.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_report_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';

class GBVReportPage extends StatefulWidget {
  static const pageRoute = '/gbvReport';

  const GBVReportPage({Key? key}) : super(key: key);

  @override
  State<GBVReportPage> createState() => _GBVReportPageState();
}

class _GBVReportPageState extends State<GBVReportPage> {
  late List<DropdownMenuItem<String>> menuItems;
  String? selectedValue ;

  TextEditingController reportMessageController = TextEditingController();
  TextEditingController abuseTypeController = TextEditingController();
  int? typeId;
  Icon? icon;
  File? file;
  String? uploadedText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
              create: (context) =>
                  GBVReportBloc(reportRepository: ReportRepository())
                    ..add(const DropDownIconPressed()),
              child: BlocConsumer<GBVReportBloc, GBVReportState>(
                  builder: buildForState,
                  listener: (blocContext, blocState) {
                    if (blocState.created == null) {
                    } else {
                      if (blocState.created == true) {
                        Navigator.of(context).pop();
                      } else {
                        const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                                "Your report was not created successfully",
                                style: TextStyle(color: Colors.white)));
                        print("Not succesfull");
                      }
                    }
                  }))),
    );
  }

  Widget buildForState(blocContext, GBVReportState blocState) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFAF5),
        appBar: AppBar(
          // titleSpacing: 0,
          centerTitle: false,
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xff99879D)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          // title: const Text(
          //   "Back",
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //       fontFamily: "Red Hat Display",
          //       fontWeight: FontWeight.w500,
          //       fontSize: 18,
          //       color: Color(0xff99879D)),
          // ),
        ),
        body: SingleChildScrollView(
            padding:
                const EdgeInsets.only(left: 15, right: 45, top: 8, bottom: 8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                    enabled: true,
                    tileColor: Colors.transparent,
                    leading: CircleAvatar(radius: 20),
                    title: Text(
                      "Francisco Fisher",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          fontFamily: "Red Hat Display"),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Report Abuse",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          fontFamily: "Red Hat Display"),
                    ),
                  ),
                  TextFormField(
                    controller: reportMessageController,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      focusColor: Color(0xffFBEEFF),
                      hoverColor: Color(0xffFBEEFF),
                      hintText: "Message",
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color: Color(0xff99879D),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Public Sans"),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xfffbeeff),
                              width: 0.5,
                              style: BorderStyle.none),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      filled: true,
                      fillColor: Color(0xfffbeeff),
                    ),
                  ),
                   Padding(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 23, horizontal: 10),
                          primary: const Color(0xffFBEEFF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(
                                  color: Colors.black, width: 0.6))),
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();
                        if (result != null) {
                          file = File(result.files.single.path.toString());
                          // ignore: avoid_print
                          print(file);
                          setState(() {
                            uploadedText = result.files.single.name.toString();
                            icon = const Icon(
                              Icons.check_circle_outlined,
                              color: Colors.green,
                            );
                          });
                        } else if (result == null) {
                          return;
                          // User canceled the picker
                        }
                      },
                      child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            uploadedText ?? "Upload File",
                            style: uploadedText == null
                                ? const TextStyle(
                                    fontFamily: "Public Sans",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff99879D))
                                : const TextStyle(
                                    fontFamily: "Public Sans",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green),
                          ),
                          SafeArea(
                              child: icon ??
                                  const Icon(Icons.file_upload,
                                      color: Color(0xff99879D)))
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.only(top: 10),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: DropdownButtonFormField(
                        focusColor: Colors.white,
                        decoration: const InputDecoration(
                          fillColor: Color(0xffFBEEFF),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(width: 0.5)),
                        ),
                        hint: const Text("Abuse Type"),
                        value: selectedValue,
                        items: blocState.abuseType.map((item) {
                         return DropdownMenuItem(
                            child: Text(item.type.toString()),
                            value: item.id,
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          typeId = newValue as int?;
                          // selectedValue = newValue.toString();
                        },
                      )),
                
                 Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: blocState.isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60.0)),
                              primary: const Color(0xffE95F9F),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 25),
                            ),
                            onPressed: () {
                              if (reportMessageController.text == '' ||
                                  reportMessageController.text.isEmpty) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment
                                            .centerRight, // 10% of the width, so there are ten blinds.
                                        colors: <Color>[
                                          Color(0xffee0000),
                                          Colors.red
                                        ], // red to yellow
                                        // repeats the gradient over the canvas
                                      ),
                                      color: Colors.white,
                                    ),
                                    // margin: EdgeInsets.fromLTRB(0, 0, 0, 75),
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text('Please enter a message'),
                                    ),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  elevation: 1000,
                                  behavior: SnackBarBehavior.fixed,
                                ));
                              } else if (file == null) {
                                // file = "" as File?;
                                // file = "assets/";
                                // ignore: unrelated_type_equality_checks
                              } else if (typeId == '' || typeId == null) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment
                                            .centerRight, // 10% of the width, so there are ten blinds.
                                        colors: <Color>[
                                          Color(0xffee0000),
                                          Colors.red
                                        ], // red to yellow
                                        // repeats the gradient over the canvas
                                      ),
                                      color: Colors.white,
                                    ),
                                    // margin: EdgeInsets.fromLTRB(0, 0, 0, 75),
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text('Please select abuse type'),
                                    ),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  elevation: 1000,
                                  behavior: SnackBarBehavior.fixed,
                                ));
                              } else {
                                BlocProvider.of<GBVReportBloc>(blocContext).add(
                                    PostGBVReportButtonPressed(
                                        reportData: ReportData(
                                            reportedby: 1,
                                            abuseType: typeId,
                                            message:
                                                reportMessageController.text),
                                        filePath: file!));
                              }
                            },
                            child: const Text("Report")),
                  )
                ])));
  }
}
