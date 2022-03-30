import 'package:bertucanfrontend/Repositories/srh_repository.dart';
import 'package:bertucanfrontend/Widgets/SRH/bloc/srh_bloc.dart';
import 'package:bertucanfrontend/Widgets/SRH/bloc/srh_event.dart';
import 'package:bertucanfrontend/Widgets/SRH/bloc/srh_state.dart';
import 'package:bertucanfrontend/Widgets/SRH/srh_article_detail.dart';
import 'package:bertucanfrontend/Widgets/SRH/ui/srh_article_item.dart';
import 'package:bertucanfrontend/arguments/srh_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SRHPage extends StatefulWidget {
  const SRHPage({Key? key}) : super(key: key);
  static const pageRoute = '/srh';

  @override
  _SRHPageState createState() => _SRHPageState();
}

class _SRHPageState extends State<SRHPage> {
  TextEditingController searchArticles = TextEditingController();
@override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    searchArticles.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
            create: (context) => SRHBloc(srhRepository: SRHRepository())
              ..add(const InitializeSRH()),
            child: BlocConsumer<SRHBloc, SRHState>(
                builder: buildForState,
                listener: (blocContext, blocState) {})));
  }

  Widget buildForState(blocContext, SRHState blocState) {
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
            "SRH Articles",
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
                controller: searchArticles,
                onChanged: (text) {
                  if (text.isEmpty && searchArticles.text.isEmpty) {
                    BlocProvider.of<SRHBloc>(blocContext)
                        .add(SearchIconPressed(searchTag: text));
                  } else {
                    text = searchArticles.text;
                    BlocProvider.of<SRHBloc>(blocContext)
                        .add(SearchIconPressed(searchTag: text));
                  }
                },
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    suffixIcon: const Icon(
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
                : blocState.articleData.isEmpty == true
                ? Center(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Icon(
                          Icons.list_alt,
                          size: 60,
                          color: Colors.grey[300]?.withOpacity(0.8),
                        ),
                        Text(
                          "No Articles To Display Yet.",
                          style: TextStyle(
                              color: Colors.grey[400]?.withOpacity(0.8)),
                        )
                      ]),
                    ),
                  )
            : SingleChildScrollView(
                child: SafeArea(
                    minimum: const EdgeInsets.all(8),
                    child: ListView.builder(
                        physics: const ScrollPhysics(),
                        itemCount: blocState.articleData.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Card(
                                elevation: 5,
                                child: SRHArticleItemWidget(
                                    articleName:
                                        "${blocState.articleData[index].title!} : ${blocState.articleData[index].id!}",
                                    articlePublisher: 'Fred',
                                    articleShortDescription: blocState
                                        .articleData[index].smallDescription!)),
                            onTap: () {
                              // ignore: avoid_print
                              print(blocState.articleData[index].id);
                              // ignore: avoid_print
                              print("is null here?");
                              Navigator.pushNamed(
                                  context, SRHArticleDetail.pageRoute,
                                  arguments: SRHArgument(
                                      blocState.articleData[index].id));
                            },
                          );
                        }))));
  }
}
