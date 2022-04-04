import 'package:bertucanfrontend/Data/report.dart';
import 'package:bertucanfrontend/Repositories/gbv_repository.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_report_bloc.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_report_event.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_report_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GBVReportPage extends StatefulWidget {
  static const pageRoute = '/gbvReport';

  const GBVReportPage({Key? key}) : super(key: key);

  @override
  State<GBVReportPage> createState() => _GBVReportPageState();
}

class _GBVReportPageState extends State<GBVReportPage> {
  late List<DropdownMenuItem<String>> menuItems;
  String selectedValue ;

  TextEditingController reportMessageController = TextEditingController();
  TextEditingController abuseTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
              create: (context) =>
                  GBVReportBloc(gbvRepository: GBVRepository()),
              child: BlocConsumer<GBVReportBloc, GBVReportState>(
                  builder: buildForState,
                  listener: (blocContext, blocState) {
                    if (blocState.created == null) {
                    } else {
                      if (blocState.created == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GBVReportPage()));
                      } else {}
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
                              width: 0.0,
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
                        // FilePickerResult? result = await FilePicker.platform
                        //     .pickFiles(allowMultiple: true);
                        // if (result == null) return;

                        // List<File> files =
                        //     result.paths.map((path) => File(path!)).toList();
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();
                        if (result != null) {
                          PlatformFile file = result.files.first;

                          // ignore: avoid_print
                          print(file.name);
                          // print(file.bytes);
                          // print(file.size);
                          // print(file.extension);
                          // print(file.path);
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Upload File",
                            style: TextStyle(
                                fontFamily: "Public Sans",
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff99879D)),
                          ),
                          Icon(Icons.file_upload, color: Color(0xff99879D))
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
                        items: dropdownItems,
                        onTap: () {
                          BlocProvider.of<GBVReportBloc>(blocContext)
                              .add(const DropDownIconPressed());
                        },
                        onChanged: (String? value) {},
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
                              BlocProvider.of<GBVReportBloc>(blocContext).add(
                                  PostGBVReportButtonPressed(
                                      reportData: ReportData(
                                          abuseType: abuseTypeController.text,
                                          message:
                                              reportMessageController.text)));
                            },
                            child: const Text("Send")),
                  )
                ])));
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(child: Text("1"), value: "1"),
      DropdownMenuItem(child: Text("2"), value: "2"),
      DropdownMenuItem(child: Text("3"), value: "3"),
      DropdownMenuItem(child: Text("4"), value: "4"),
    ];
    return menuItems;
  }
}
