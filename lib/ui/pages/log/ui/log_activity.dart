import 'package:flutter/material.dart';

class LogActivities extends StatelessWidget {
  static const String routeName = '/log_activities';
  const LogActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime _date = DateTime.now();
    const Map<int,String> monthsInYear = {
      1: "January",
      2: "February",
      3: "March",
      4: "April",
      5: "May",
      6: "June",
      7: "July",
      8: "August",
      9: "September",
      10:"October",
      11: "November",
      12: "December"
    };
    final day = _date.day.toString();
    final month = _date.month;
    final _appBarTitle = '$day ${monthsInYear[month]}';
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(_appBarTitle, style: const TextStyle(color: Colors.black, fontFamily: 'Poppins Medium'),),
        elevation: 0,
        centerTitle: true,
        leading: InkWell(child: const Icon(Icons.close, color: Colors.black,),onTap: (){Navigator.pop(context);},),
        actions: const [Icon(Icons.help, color: Colors.black,),],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text('Weight', style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 14),),
                      const SizedBox(height: 4,),
                      Container(
                        width: 60,
                        height: 60
                        ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: const Color(0xFFE4F7F9),
                        ),
                        child: (
                        Image.asset('assets/badge.png', width: 30, height: 20, fit: BoxFit.scaleDown,)
                        ),
                      )
                    ],
                  ),

                  Column(
                    children: [
                      const Text('Sleep', style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 14),),
                      SizedBox(height: 4,),
                      Container(
                        width: 60,
                        height: 60
                        ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xFFE4F7F9),
                        ),
                        child: (
                            Image.asset('assets/badge.png', width: 30, height: 30,)
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Water', style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 14),),
                      const SizedBox(height: 4,),
                      Container(
                        width: 60,
                        height: 60
                        ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xFFE4F7F9),
                        ),
                        child: (
                            Image.asset('assets/badge.png', width: 30, height: 30,)
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(height: 1,color: const Color(0xFFEAEAEA),),
            const SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Sex and Sex Drive', style: TextStyle(fontSize: 18, fontFamily: 'Poppins Bold'),),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(

                    children: [
                      const SizedBox(width: 25,),
                      buildIcond('heart.png', "Didn't have sex", const Color(0xFFED6392)),
                      const SizedBox(width: 15,),
                      buildIcond('shield.png', "Protected Sex", const Color(0xFFED6392)),
                      const SizedBox(width: 15,),
                      buildIcond('like.png', "Unprotected sex", const Color(0xFFED6392)),
                      const SizedBox(width: 15,),
                      buildIcond('like_2.png', "High sex drive", const Color(0xFFED6392)),
                      const SizedBox(width: 15,),
                      buildIcond('heart_2.png', "Masturbation", const Color(0xFFED6392))
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: 20,),
            Container(height: 1,color: const Color(0xFFEAEAEA),),
            const SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Mood', style: TextStyle(fontSize: 18, fontFamily: 'Poppins Bold'),),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(

                    children: [
                      const SizedBox(width: 25,),
                      buildIcond('calm.png', "Calm", const Color(0xFFFC9A2F)),
                      const SizedBox(width: 15,),
                      buildIcond('happy.png', "Happy", const Color(0xFFFC9A2F)),
                      const SizedBox(width: 15,),
                      buildIcond('power.png', "Energetic", const Color(0xFFFC9A2F)),
                      const SizedBox(width: 15,),
                      buildIcond('friskiness.png', "Frisky", const Color(0xFFFC9A2F)),
                      const SizedBox(width: 15,),
                      buildIcond('sad.png', "Mood swings", const Color(0xFFFC9A2F))
                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: 20,),
            Container(height: 1,color: const Color(0xFFEAEAEA),),
            const SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Symptoms', style: TextStyle(fontSize: 18, fontFamily: 'Poppins Bold'),),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(

                    children: [
                      const SizedBox(width: 25,),
                      buildIcond('feedback.png', "Everything\nis fine", const Color(0xFFC062CF)),
                      const SizedBox(width: 15,),
                      buildIcond('pain.png', "Cramps", const Color(0xFFC062CF)),
                      const SizedBox(width: 15,),
                      buildIcond('breast.png', "Tender\nBreasts", const Color(0xFFC062CF)),
                      const SizedBox(width: 15,),
                      buildIcond('migraine.png', "Headache", const Color(0xFFC062CF)),
                      const SizedBox(width: 15,),
                      buildIcond('gallery.png', "Acne", const Color(0xFFC062CF))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Column buildIcond(String image, String tag, Color color) {
    return Column(
                      children:  [
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 2.0,
                          fillColor: color,
                          child: Image.asset(
                            'assets/$image',
                            height: 35.0,
                            width: 35,
                          ),
                          padding: const EdgeInsets.all(15.0),
                          shape: const CircleBorder(),
                        ),
                         Text(tag)
                      ],
                    );
  }
}
