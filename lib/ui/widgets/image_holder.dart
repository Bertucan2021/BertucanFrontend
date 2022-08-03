import 'dart:convert';

import 'package:bertucanfrontend/core/services/api_storage_service.dart';
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
    return path != null
        ? FutureBuilder<String?>(
            future: imageClient.getImage(path!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Image.memory(
                  base64Decode(snapshot.data!),
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
