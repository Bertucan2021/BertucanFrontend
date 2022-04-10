import 'package:flutter/material.dart';

class SRHArticleItemWidget extends StatefulWidget {
  final String articleName;
  final String articlePublisher;
  final String image;
  final String articleShortDescription;

  const SRHArticleItemWidget(
      {Key? key,
      required this.articleName,
      required this.articlePublisher,
      required this.image,
      required this.articleShortDescription})
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
              child: widget.image.isEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 0),
                        // height: 70.0,
                        width: 75.0,
                        color: Colors.pink.shade400,
                        child: Center(
                          child: Text(
                            widget.articleName == " "
                                ? "Image"
                                : widget.articleName
                                    .substring(0, 1)
                                    .toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Image.network(
                        widget.image,
                        color: null,
                        fit: BoxFit.contain,
                        height: screenHeight,
                        width: width / 4,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: 75,
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.grey,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.articleName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: "Cabin",
                          color: Color(0xff384f7d),
                          fontSize: 18)),
                  Text(widget.articleShortDescription,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "Cabin",
                          color: Color(0xff384f7d),
                          fontSize: 14)),
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
