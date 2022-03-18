// ignore_for_file: unnecessary_const

import 'package:bertucanfrontend/Model/cycle_model.dart';
import 'package:bertucanfrontend/Widgets/log/ui/log_activity.dart';
import 'package:bertucanfrontend/Widgets/log/ui/period.dart';
import 'package:bertucanfrontend/Widgets/notification/ui/notification.dart';
import 'package:bertucanfrontend/bloc/cycle/cycle_bloc.dart';
import 'package:bertucanfrontend/bloc/cycle/cycle_event.dart';
import 'package:bertucanfrontend/bloc/cycle/cycle_state.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:badges/badges.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final day = today.day.toString();
    final month = today.month;
    final year = today.year.toString();

    const Map<int,String> monthsInYear = {
      1: "Jan",
      2: "Feb",
      3: "Mar",
      4: "Apr",
      5: "May",
      6: "Jun",
      7: "Jul",
      8: "Aug",
      9: "Sep",
      10:"Oct",
      11: "Nov",
      12: "Dec"
    };
    String cycleDate = day;
    final date = '$cycleDate ${monthsInYear[month]}, $year';
    DatePickerController controller = DatePickerController();
    
    
    // debugPrint();
    return  SafeArea(

      child: Scaffold(
        backgroundColor: const Color(0xFFFEEFF2),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics() ,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: BlocBuilder<CycleBloc, CycleState>(
              builder: (context, state){
                print('tesst');
                print(state.toString() + 'state');
                if( state is CycleSuccessState){
                  print(state.phase);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(date,
                              style: const TextStyle(fontSize: 24,color: Color(0xFF6B6464), fontFamily: 'Poppins Bold'), overflow: TextOverflow.ellipsis,),
                          ),
                          Badge(badgeContent: const Text('2', style: TextStyle(color: Colors.white),),child: InkWell(onTap: (){
                            Navigator.pushNamed(context, NotificationsPage.routeName);
                          },child: const Icon(Icons.notifications, size: 35, color: Colors.orange,)))
                        ],

                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const SizedBox(height: 20,),
                          SizedBox(
                            height: 90,
                            child: DatePicker(
                              // DateTime.now().subtract(const Duration(days: 30)),
                                DateTime.now(),
                                initialSelectedDate: DateTime.now(),

                                selectionColor: const Color(0xFFF7924A),

                                selectedTextColor: Colors.white,
                                dateTextStyle: const TextStyle(fontFamily: 'Poppins Bold'),
                                monthTextStyle: const TextStyle(fontFamily: 'Poppins Bold'),
                                dayTextStyle: const TextStyle(fontFamily: 'Poppins Bold'),

                                onDateChange: (date) {
                                  // New date selected
                                  cycleDate = date.day.toString();
    BlocProvider.of<CycleBloc>(context)
        .add(GetDateBasedPhase(date: date));
                                }),
                          )
                          ,

                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        height: 160,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            color: Color(0xFFF7924A)
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[ CircularPercentIndicator(
                              radius: 60.0,
                              lineWidth: 7.0,
                              backgroundColor: Colors.white38,
                              rotateLinearGradient: true,
                              animateFromLastPercent: true,
                              startAngle: 180,
                              percent:( (state.day*100)/28)/100,
                              center:  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  const SizedBox(width: 4,),
                                  const Text("day",overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(color: Colors.white, fontSize: 19),),
                                  Text(
                                    '${state.day}'.toString(),  style: const TextStyle(color: Colors.white, fontSize: 35),)
                                ],
                              ),
                              progressColor: Colors.white,
                            ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(state.phase,style: const TextStyle(color: Colors.white, fontSize: 26, overflow: TextOverflow.ellipsis),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:  [
                                      const Text('Chance of Pregnancy: ', style: TextStyle(color: Colors.white70, fontSize: 16, overflow: TextOverflow.ellipsis),),
                                      Text(state.chanceOfPregnancy, style: const TextStyle(color: Colors.white, fontSize: 18, overflow: TextOverflow.ellipsis),)
                                    ],
                                  )
                                ],
                              ),

                            ]),
                      ),
                      const SizedBox(height: 10,),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildViews('Weight', '65', 'KG',  Colors.white),
                            const SizedBox(width: 15,),
                            buildViews('Period In', (28 - state.day).toString(), 'Days', const Color(0xFF56C9C2)),
                            const SizedBox(width: 15,),
                            buildViews('Water', '3', 'Litters', const Color(0xFFBAD5FD)),

                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text('My Daily Insights', style: TextStyle(fontSize: 25, fontFamily: 'Poppins Bold', ),),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              PhysicalModel(
                                color: Colors.white,
                                elevation: 8,
                                shadowColor: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                                child:  SizedBox(
                                  width: 100,
                                  height: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(context, LogActivities.routeName);
                                      },
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children:  [
                                          const Flexible(child: Text('Log your', maxLines: 1 , overflow: TextOverflow.fade,softWrap: false,style: TextStyle(),)),
                                          const Flexible(child: Text('symptoms', maxLines: 1 , overflow: TextOverflow.fade,softWrap: false,style: TextStyle(),)),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: const Color(0xFF56C9C2)
                                            ),
                                            child: const Icon(Icons.add, color: Colors.white,),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20,),
                              PhysicalModel(
                                color: const Color(0xFFA3E7F0),
                                elevation: 8,
                                shadowColor: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                                child:  SizedBox(
                                  width: 100,
                                  height: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:   [
                                        const Flexible(child: Text("Today's", maxLines: 1 , overflow: TextOverflow.fade,softWrap: false,style: TextStyle(),)),
                                        const Flexible(child: Text('Cycle Day', maxLines: 1 , overflow: TextOverflow.fade,softWrap: false,style: TextStyle(),)),
                                        Text(state.day.toString(), style: const TextStyle(fontSize: 30,color: Colors.white),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 20,),
                              PhysicalModel(
                                color: const Color(0xFFBAD5FD),
                                elevation: 8,
                                shadowColor: Colors.teal,
                                borderRadius: BorderRadius.circular(10),
                                child:  SizedBox(
                                  width: 100,
                                  height: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:   [
                                        const Flexible(child: Text("Chance of", maxLines: 1 , overflow: TextOverflow.fade,softWrap: false,style: TextStyle(),)),
                                        const Flexible(child: Text('getting', maxLines: 1 , overflow: TextOverflow.fade,softWrap: false,style: TextStyle(),)),
                                        const Flexible(child: Text('pregnant', maxLines: 1 , overflow: TextOverflow.fade,softWrap: false,style: TextStyle(),)),

                                        Text(state.chanceOfPregnancy, style: const TextStyle(fontSize: 28,color: Colors.white, fontFamily: 'Poppins Bold'),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:  [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text('My Cycles', style: TextStyle(fontSize: 25, fontFamily: 'Poppins Bold', ),),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)
                                    ,                          color: const Color(0xFFFFFFFF),

                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const [
                                                Text('Previous cycle length', style: TextStyle(color: Color(0xFF474747), fontSize: 20),),
                                                Text('37 days',style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 20))
                                              ],

                                            ),
                                            const Text('Abnormal', style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 20))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(height: 1,color: const Color(0xFFEAEAEA),),
                                      const SizedBox(height: 20,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const [
                                                Text('Previous cycle length', style: TextStyle(color: Color(0xFF474747), fontSize: 20),),
                                                Text('5 days',style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 20))
                                              ],

                                            ),
                                            const Text('Normal', style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 20))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ]),

                          const SizedBox(height: 30,),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:  [

                                const SizedBox(height: 20,),
                                Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)
                                    ,                          color: const Color(0xFFFFFFFF),

                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            // SizedBox(height: 8,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const [
                                                Text('Cycle history', style: TextStyle(color: Color(0xFF474747), fontSize: 20),),
                                              ],

                                            ),
                                            const Text('See all >', style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 20, color: Color(0xFF828282)))
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      Container(height: 1,color: const Color(0xFFEAEAEA),),
                                      const SizedBox(height: 20,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const [
                                                Text('Current cycle: 27 days', style: TextStyle(color: Color(0xFF474747), fontSize: 18, fontFamily: 'Poppins Bold'),),
                                                Text('Started Dec 27, 2021',style: TextStyle(fontFamily: 'Poppins Regular', fontSize: 14, color:  const Color(0xFF474747)))
                                              ],

                                            ),
                                            const Text('>', style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 30,color:  const Color(0xFF474747)),)
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 10,),
                                      Container(height: 1,color: const Color(0xFFEAEAEA),),
                                      InkWell(
                                        onTap: (){
                                          Navigator.pushNamed(context, LogPeriod.routeName);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    color: const Color(0xFFDF438B),
                                                    borderRadius: BorderRadius.circular(30)
                                                ),
                                                child: const Center(child: Icon(Icons.add, color: Colors.white, size: 30,)) ,
                                              ),
                                              const SizedBox(width: 10,),
                                              const Text('Log your Cycle', style: TextStyle(color: Color(0xFFDF438B), fontFamily: 'Poppins Bold', fontSize: 20),)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ])
                        ],
                      )
                    ],
                  );
                }
                else {
                  // if(state is CycleLoadingState){
                  //   return const CircularProgressIndicator();
                  // }
                  print('are we herere');
                  BlocProvider.of<CycleBloc>(context)
                      .add(GetDateBasedPhase(date: DateTime.now()));
                  return Container();
                }
              },

            ),
          ),
        ),
      ),
    );
  }
  
  
  
  
  
  

  Container buildViews(String headline, String value, String units, Color background) {
    return Container(height: 100, width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: background,
                    ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(headline, overflow: TextOverflow.ellipsis,style: const TextStyle(fontSize: 20),),
                          Row(
                            textBaseline: TextBaseline.ideographic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children:  [Text(value, style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Color(0xFFDF438B)),),  Text(units, style: const TextStyle(color: Color(0xFFDF438B), fontSize: 20),)],
                          )
                        ],
                      ),
                    );
  }
}
