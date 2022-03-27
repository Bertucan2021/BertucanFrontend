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
  String selectedValue = "1";

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
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: DropdownButtonFormField(
                        focusColor: Colors.white,
                        decoration: const InputDecoration(
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(),
                        ),
                        hint: const Text("Abuse Type"),
                        value: selectedValue,
                        items: dropdownItems,
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                      )),
                  Padding(
                      child: Tooltip(
                        message: "Tap Here To Add Location",
                        child: GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            "assets/pickLocation.png",
                            fit: BoxFit.contain,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0)),
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
