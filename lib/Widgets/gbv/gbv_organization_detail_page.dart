import 'package:bertucanfrontend/Repositories/gbv_repository.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_detail_bloc.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_detail_event.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:map_launcher/map_launcher.dart';
import 'package:shimmer/shimmer.dart';

class GBVOrganizationDetail extends StatefulWidget {
  const GBVOrganizationDetail({Key? key, this.id}) : super(key: key);
  static const pageRoute = '/gbvDetail';
  final int? id;

  @override
  State<GBVOrganizationDetail> createState() => _GBVOrganizationDetailState();
}

class _GBVOrganizationDetailState extends State<GBVOrganizationDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
            create: (context) => GBVDetailBloc(gbvRepository: GBVRepository())
              ..add(InitializeGBVDetailEvent(widget.id!)),
            child: BlocConsumer<GBVDetailBloc, GBVDetailState>(
                builder: buildForState,
                listener: (blocContext, blocState) {})));
  }

  Widget buildForState(blocContext, GBVDetailState blocState) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffFFFAF5),
      appBar: AppBar(
        titleSpacing: 0,
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
        // actions: [],
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
      body: blocState.isLoading == true
          ? Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    enabled: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              radius: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            CircleAvatar(
                              radius: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            CircleAvatar(
                              radius: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                        ),
                        Center(
                          child: Container(
                            width: 100.0,
                            height: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 2),
                        ),
                        Center(
                          child: Container(
                            width: screenWidth / 1.5,
                            height: 8.0,
                            color: Colors.white,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Center(
                          child: Container(
                            width: screenWidth / 1.5,
                            height: 8.0,
                            color: Colors.white,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Center(
                          child: Container(
                            width: screenWidth / 1.5,
                            height: 8.0,
                            color: Colors.white,
                          ),
                        ),
                        Center(
                          child: Container(
                            width: screenWidth / 1.5,
                            height: 8.0,
                            color: Colors.white,
                          ),
                        ),
                        Center(
                          child: Container(
                            width: screenWidth / 1.5,
                            height: 8.0,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Center(
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              width: screenWidth / 2,
                              height: 60.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Center(
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              width: screenWidth / 2,
                              height: 60.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                    Center(
                        child: Text(blocState.gbvCentersData.name!,
                            style: TextStyle(
                              fontFamily: "Public Sans",
                              color: Colors.primaries.first,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ))),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 35),
                      child: Text(
                        blocState.gbvCentersData.description == null
                            ? " "
                            : blocState.gbvCentersData.description!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: "Public Sans",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff99879D)),
                      ),
                    ),
                    /* Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      child: blocState.gbvCentersData.lat == null ||
                              blocState.gbvCentersData.long == null
                          ? const ElevatedButton(
                              onPressed: null,
                              child: Text('Unable to display location'))
                          : ElevatedButton(
                              onPressed: () async {
                                // ignore: avoid_print
                                print(blocState.gbvCentersData.lat);
                                final availableMaps =
                                    await MapLauncher.installedMaps;
                                await availableMaps.first.showMarker(
                                  coords: Coords(
                                      double.tryParse(
                                          blocState.gbvCentersData.lat!)!,
                                      double.tryParse(
                                          blocState.gbvCentersData.long!)!),
                                  title: blocState.gbvCentersData.city!,
                                );
                              },
                              child: const Text("View Location"),
                              style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 25)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60.0),
                                  )))),
                    ), */
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 25)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60.0),
                              ))),
                          onPressed: () {
                            Navigator.pushNamed(context, '/gbvReport');
                          },
                          child: const Text("Report Abuse")),
                    )
                  ]),
            ),
    );
  }
}
