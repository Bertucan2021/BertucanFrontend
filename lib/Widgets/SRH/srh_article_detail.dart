import 'package:bertucanfrontend/Repositories/srh_repository.dart';
import 'package:bertucanfrontend/Widgets/SRH/bloc/srh_detail_bloc.dart';
import 'package:bertucanfrontend/Widgets/SRH/bloc/srh_detail_event.dart';
import 'package:bertucanfrontend/Widgets/SRH/bloc/srh_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SRHArticleDetail extends StatefulWidget {
  const SRHArticleDetail({Key? key, this.id}) : super(key: key);
  static const pageRoute = '/srhDetail';
  final int? id;
  @override
  State<SRHArticleDetail> createState() => _SRHArticleDetailState();
}

class _SRHArticleDetailState extends State<SRHArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
            create: (context) => SRHDetailBloc(srhRepository: SRHRepository())
              ..add(InitializeSRHDetailEvent(widget.id!)),
            child: BlocConsumer<SRHDetailBloc, SRHDetailState>(
                builder: buildForState,
                listener: (blocContext, blocState) {})));
  }

  Widget buildForState(blocContext, SRHDetailState blocState) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFAF5),
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xff99879D)),
            onPressed: () {
              Navigator.of(context).pop();
            },
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
        body: blocState.isLoading == true
            ? Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child:
                    Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                  Expanded(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 35, horizontal: 20),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 20),
                              color: const Color(0xffDF438B),
                              child: Container(
                                width: 200,
                                height: 8.0,
                                color: Colors.white,
                              )),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 12.0,
                                      color: Colors.white,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 8.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Container(
                            width: 100.0,
                            height: 8.0,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Container(
                            width: 200.0,
                            height: 8.0,
                            color: Colors.white,
                          ),
                          Container(
                            width: 200.0,
                            height: 8.0,
                            color: Colors.white,
                          ),
                          Container(
                            width: 200.0,
                            height: 8.0,
                            color: Colors.white,
                          ),
                          Container(
                            width: 200.0,
                            height: 8.0,
                            color: Colors.white,
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
                      Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 35, horizontal: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 45, vertical: 20),
                          color: const Color(0xffDF438B),
                          child: const Text(
                            "You are in charge of this project \n Deadline 28/03/2020",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Public Sans",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white),
                          )),
                      const ListTile(
                        enabled: true,
                        tileColor: Colors.transparent,
                        leading: CircleAvatar(radius: 20),
                        title: Text("Francisco Fisher"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                            "Posted " +
                                convertToAgo(blocState.articleData.createdAt!),
                            style: const TextStyle(
                                fontFamily: "Public Sans",
                                fontWeight: FontWeight.w300,
                                fontSize: 12.8,
                                color: Color(0xff99879D))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(blocState.articleData.body!,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                fontFamily: "Public Sans",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xff99879D))),
                      ),
                    ])));
  }

  String convertToAgo(String inputDate) {
    DateTime time1 = DateTime.parse(inputDate);
    Duration diff = DateTime.now().difference(time1);
    if (diff.inDays >= 1) {
      return '${diff.inDays} day(s) ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour(s) ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute(s) ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second(s) ago';
    } else {
      return "Just now!";
    }
  }
}
