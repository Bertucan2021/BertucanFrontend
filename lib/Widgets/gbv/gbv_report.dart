import 'package:flutter/material.dart';

class GBVReportPage extends StatefulWidget {
  static const pageRoute = '/gbvReport';

  const GBVReportPage({Key? key}) : super(key: key);

  @override
  State<GBVReportPage> createState() => _GBVReportPageState();
}

class _GBVReportPageState extends State<GBVReportPage> {
  TextEditingController reportController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFAF5),
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: const Icon(
            Icons.arrow_back,
            color: Color(0xffFAF9FE),
          ),
          title: const Text(
            "Back",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "Red Hat Display",
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Color(0xff99879D)),
          ),
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
                    controller: reportController,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60.0)),
                          primary: const Color(0xffE95F9F),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 25),
                        ),
                        onPressed: () {},
                        child: const Text("Send")),
                  )
                ])));
  }
}
