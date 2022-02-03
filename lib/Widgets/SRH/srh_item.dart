import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

class SRHItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 150.0,
              width: 120.0,
              color: Colors.transparent,
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: const Center(
                    // ignore: unnecessary_const
                    child: Text("Rounded Corner Rectangle Shape",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                        textAlign: TextAlign.center),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
