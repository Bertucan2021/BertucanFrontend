import 'package:bertucanfrontend/Widgets/SRH/ui/srh_article_item.dart';
import 'package:flutter/material.dart';

class SRHPage extends StatefulWidget {
  const SRHPage({Key? key}) : super(key: key);

  @override
  _SRHPageState createState() => _SRHPageState();
}

class _SRHPageState extends State<SRHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFAF5),
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: const Color(0xffFFFAF5),
            title: const Text('SRH Articles',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    height: 36))),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ListView.builder(
                    physics: const ScrollPhysics(),
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const Card(
                          elevation: 5,
                          child: SRHArticleItemWidget(
                              articleName: 'Remote', articlePublisher: 'Fred'));
                    }))));
  }
}
