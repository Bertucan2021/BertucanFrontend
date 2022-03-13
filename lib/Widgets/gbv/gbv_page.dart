import 'package:bertucanfrontend/Repositories/gbv_repository.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_page_bloc.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_page_event.dart';
import 'package:bertucanfrontend/Widgets/gbv/bloc/gbv_page_state.dart';
import 'package:bertucanfrontend/Widgets/gbv/gbv_organization_detail_page.dart';
import 'package:bertucanfrontend/arguments/gbv_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class GBVPage extends StatefulWidget {
  const GBVPage({Key? key}) : super(key: key);
  static const pageRoute = '/gbv';

  @override
  State<GBVPage> createState() => _GBVPageState();
}

class _GBVPageState extends State<GBVPage> {
  TextEditingController searchEngine = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
            create: (context) => GBVPageBloc(gbvRepository: GBVRepository())
              ..add(const InitializeGBVCenters()),
            child: BlocConsumer<GBVPageBloc, GBVPageState>(
                builder: buildForState,
                listener: (blocContext, blocState) {})));
  }

  Widget buildForState(blocContext, GBVPageState blocState) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFAF5),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 120,
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "GBV Locations",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontSize: 24),
          ),
          bottom: PreferredSize(
            preferredSize: Size.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 20,
                    ),
                    filled: true,
                    hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'cabin',
                        fontWeight: FontWeight.w400),
                    hintText: "Search article",
                    fillColor: Colors.transparent),
              ),
            ),
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
                    child: ListView.builder(
                      itemBuilder: (_, __) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                      ),
                      itemCount: 20,
                    ),
                  )),
                ]))
            : SingleChildScrollView(
                child: SafeArea(
                    minimum: const EdgeInsets.all(8),
                    child: ListView.builder(
                      physics: const ScrollPhysics(),
                      itemCount: blocState.gbvCentersData.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, GBVOrganizationDetail.pageRoute,
                                  arguments: GBVArgument(
                                      blocState.gbvCentersData[index].id));
                            },
                            enabled: true,
                            tileColor: Colors.white,
                            leading: const CircleAvatar(radius: 20),
                            title: Text(
                                blocState.gbvCentersData[index].name == null
                                    ? " "
                                    : blocState.gbvCentersData[index].name!),
                            subtitle: Text(blocState
                                        .gbvCentersData[index].phonenumber ==
                                    null
                                ? " "
                                : blocState.gbvCentersData[index].phonenumber!),
                            trailing: const Icon(
                              Icons.chevron_right,
                              color: Color(0xffEF5DA8),
                            ),
                          ),
                        );
                      },
                    ))));
  }
}
