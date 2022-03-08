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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
        width: width,
        height: height / 4,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            ClipRRect(
              child: Image.asset(widget.image,
                  fit: BoxFit.contain, width: width / 4),
            ),
            Column(
              children: [
                Text(
                  widget.articleName,
                ),
                Text(widget.articlePublisher)
              ],
            )
          ],
        ));
  }
}
