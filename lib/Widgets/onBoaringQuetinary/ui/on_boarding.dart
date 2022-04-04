import 'package:flutter/material.dart';

class Questionnaire extends StatefulWidget {
  static const String routeName = 'questionnaire';
  const Questionnaire({Key? key}) : super(key: key);

  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  int _activeStepIndex = 0;

  // TextEditingController name = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController pass = TextEditingController();
  // TextEditingController address = TextEditingController();
  // TextEditingController pinCode = TextEditingController();
  Set<String> menstrial = {};

  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text(
            'Is your menstrual cycle regular? (Varies by no more than 7 days)',
            style: TextStyle(fontSize: 20),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  print(menstrial.toString());
                  setState(() {
                    if (menstrial.contains('My Cycle is regular')){
                      menstrial.remove('My Cycle is regular');
                    }
                    else{
                    menstrial.add('My Cycle is regular');}
                  });
                  print(menstrial.toString());
                },
                child: Container(
                    decoration:  BoxDecoration(color: menstrial.contains('My Cycle is regular')?Colors.pink: const Color(0xFFC4C4C4)),
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              'My Cycle is regular',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                  decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          'My Cycle is irregular',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 8,
              ),
              Container(
                  decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          "I don't know",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        Step(
            state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text(
              'Do you experience discomfort due to any of the following?',
              style: TextStyle(fontSize: 20),
            ),
            content: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Painful menstrual cramps",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "PMS symptoms",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Unusual discharge",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Heavy menstrual flow",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Mood swings",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Other",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "No, nothing bothers me",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ],
            )),
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text(
              'Do you have any reproductive health disorders (endometriosis, PCOS, etc)',
              style: TextStyle(fontSize: 20),
            ),
            content: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Yes",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "No",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "No, but i used to",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "I don't know",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ],
            )),
        Step(
            state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text(
              'Do you experience discomfort due to any of the following?',
              style: TextStyle(fontSize: 20),
            ),
            content: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Painful menstrual cramps",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "PMS symptoms",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Unusual discharge",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Heavy menstrual flow",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Mood swings",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Other",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "No, nothing bothers me",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ],
            )),
        Step(
            state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text(
              'Do you experience discomfort due to any of the following?',
              style: TextStyle(fontSize: 20),
            ),
            content: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Painful menstrual cramps",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "PMS symptoms",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Unusual discharge",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Heavy menstrual flow",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Mood swings",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Other",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "No, nothing bothers me",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ],
            )),
        Step(
            state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text(
              'Do you experience discomfort due to any of the following?',
              style: TextStyle(fontSize: 20),
            ),
            content: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Painful menstrual cramps",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "PMS symptoms",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Unusual discharge",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Heavy menstrual flow",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Mood swings",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "Other",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    decoration: const BoxDecoration(color: Color(0xFFC4C4C4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            "No, nothing bothers me",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    )),
              ],
            )),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F4),
      drawerScrimColor: Colors.teal,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Log your symptoms', style: TextStyle(color: Colors.black, fontSize: 26, fontFamily: 'Poppins Bold'),),
        backgroundColor: const Color(0xFFF9F5F4),
        elevation: 0.0,
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            setState(() {
              _activeStepIndex += 1;
            });
          } else {
            Navigator.pushNamed(context, '/');
          }
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }

          setState(() {
            _activeStepIndex -= 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _activeStepIndex = index;
          });
        },
        // controlsBuilder: (context,  {onStepContinue, onStepCancel}) {
        //   final isLastStep = _activeStepIndex == stepList().length - 1;
        //   return Container(
        //     child: Row(
        //       children: [
        //         Expanded(
        //           child: ElevatedButton(
        //             onPressed: onStepContinue,
        //             child: (isLastStep)
        //                 ? const Text('Submit')
        //                 : const Text('Next'),
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 10,
        //         ),
        //         if (_activeStepIndex > 0)
        //           Expanded(
        //             child: ElevatedButton(
        //               onPressed: onStepCancel,
        //               child: const Text('Back'),
        //             ),
        //           )
        //       ],
        //     ),
        //   );
        // },
      ),
    );
  }
}
