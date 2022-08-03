import 'dart:convert';
import 'dart:developer';

import 'package:bertucanfrontend/core/services/api_storage_service.dart';
import 'package:bertucanfrontend/utils/constants.dart';
import 'package:flutter/material.dart';

class ImageHolder extends StatelessWidget {
  final String? path;
  final double width;
  final double height;
  ImageHolder({
    Key? key,
    this.path,
    this.width = 150,
    this.height = 150,
  }) : super(key: key);

  ApiStorageClient imageClient = ApiStorageClient();
  @override
  Widget build(BuildContext context) {
    String? imagePath = path;
    if (path != null && path![0] != '/') {
      imagePath = "/$path";
    }
    return imagePath != null
        ? FutureBuilder<String?>(
            future: imageClient.getImage(imagePath),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                log("image data: ${snapshot.data}");
                return Image.network(
                  '$kBaseStorageUrl$imagePath',
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                );
              } else {
                return Icon(
                  Icons.person,
                  color: Colors.grey,
                );
              }
            },
          )
        : Icon(
            Icons.person,
            color: Colors.grey,
          );
  }
}
