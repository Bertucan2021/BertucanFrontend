import 'package:flutter/material.dart';

class SRHArticleItemWidget extends StatefulWidget {
  final String articleName;
  final String articlePublisher;
  final String image;

  const SRHArticleItemWidget(
      {Key? key,
      required this.articleName,
      required this.articlePublisher,
      this.image = "assets/srharticle.png"})
      : super(key: key);

  @override
  _SRHArticleItemWidgetState createState() => _SRHArticleItemWidgetState();
}

class _SRHArticleItemWidgetState extends State<SRHArticleItemWidget> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 120,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        isThreeLine: false,
        enabled: true,
        tileColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                widget.image,
                color: null,
                fit: BoxFit.contain,
                height: screenHeight,
                width: width / 4,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.articleName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Cabin",
                          color: Color(0xff384f7d),
                          fontSize: 18)),
                  Text(widget.articlePublisher,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "Cabin",
                          color: const Color(0xff384f7d).withOpacity(0.8),
                          fontStyle: FontStyle.italic,
                          fontSize: 14)),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 25,
              color: Color(0xffEF5DA8),
            ),
          ],
        ),
      ),
    );
  }
}
