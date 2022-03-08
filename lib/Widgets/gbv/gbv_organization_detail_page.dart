import 'package:flutter/material.dart';

class GBVOrganizationDetail extends StatefulWidget {
  const GBVOrganizationDetail({Key? key}) : super(key: key);
  static const pageRoute = '/gbv_detail';

  @override
  State<GBVOrganizationDetail> createState() => _GBVOrganizationDetailState();
}

class _GBVOrganizationDetailState extends State<GBVOrganizationDetail> {
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
          color: Color(0xff99879D),
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
        padding: const EdgeInsets.all(8),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 35),
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
              color: const Color(0xffDF438B),
              child: const Text(
                "You are in charge of this project \n Deadline 28/03/2020",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Public Sans",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/Twitter Icon.png',
                  ),
                  Image.asset(
                    'assets/images/Instagram Icon.png',
                  ),
                  Image.asset(
                    'assets/images/Dribbble Icon.png',
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 35),
            child: const Text(
              "I need a designer for my new website The project is just at the beginning and I need wireframes before I start coding the website. I only want wireframes and I don’t want prototype or UI design.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Public Sans",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff99879D)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: ElevatedButton(
                onPressed: () {},
                child: const Text("View Location"),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 25)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    )))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 25)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ))),
                onPressed: () {},
                child: const Text("Report Abuse")),
          )
        ]),
      ),
    );
  }
}
