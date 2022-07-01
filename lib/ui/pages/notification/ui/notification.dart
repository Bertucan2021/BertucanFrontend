import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  static const String routeName = '/notifications';
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Notification', style: TextStyle(color: Colors.black, fontFamily: 'Poppins Bold'),),
        leading: InkWell(child: const Icon(Icons.arrow_back, color: Colors.black,), onTap: (){Navigator.pop(context);},),
        actions: const [Icon(Icons.settings, color: Colors.black,)],
        elevation: 0,
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: const [Text('NEW', style: TextStyle(fontFamily: 'Poppins Bold'),)],),
          ),
          buildNotificationContainer(),
          const SizedBox(height: 15,),
          buildNotificationContainer()
        ],
      )
    );
  }

  Container buildNotificationContainer() {
    return Container(
          color: const Color(0xFFFEEFF2),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset('assets/badge.png', width: 80 , height: 80,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Introducing Secret Chat Rules!', style: TextStyle(fontFamily: 'Poppins Bold'),),
                    Text('Sever guidelines to keep things safe and fun\nfor everyone'),
                    Text('Take a look >', style: TextStyle(color: Colors.blue),)
                  ],
                )
              ],
            ),
          ),
        );
  }
}
