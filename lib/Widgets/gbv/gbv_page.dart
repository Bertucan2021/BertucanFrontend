import 'package:flutter/material.dart';

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
        body: SingleChildScrollView(
            child: SafeArea(
                minimum: const EdgeInsets.all(8),
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    ListTile(
                      enabled: true,
                      //style: ListTileStyle.list,
                      tileColor: Colors.white,
                      leading: CircleAvatar(radius: 20),
                      title: Text("Jacob Jones"),
                      subtitle: Text("miss a call"),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Color(0xffEF5DA8),
                      ),
                    ),
                  ],
                ))));
  }
}
