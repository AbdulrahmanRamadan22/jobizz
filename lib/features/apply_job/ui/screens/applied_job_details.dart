import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/button_app_text.dart';


class AppliedJobDetailsScreen extends StatefulWidget {
  const AppliedJobDetailsScreen({super.key});

  @override
  State<AppliedJobDetailsScreen> createState() =>
      _AppliedJobDetailsScreenState();
}

class _AppliedJobDetailsScreenState extends State<AppliedJobDetailsScreen> {
  List<Map<String, dynamic>> stepperList = [
    {"title": "Offer letter", "subtitle": "Not yet"},
    {"title": "Team matching", "subtitle": "12/06/22   |   10:00 am"},
    {"title": "Final HR interview", "subtitle": "21/06/22  |   04:00 pm"},
    {"title": "Technical interview", "subtitle": "10/05/22   |   2:00 am"},
    {"title": "Screening interview", "subtitle": "05/06/22   |   10:00 am"},
    {
      "title": "Reviewed by Spotify team",
      "subtitle": "25/05/22   |   10:00 am"
    },
    {"title": "Application submitted", "subtitle": "25/05/22   |   10:00 am"},
  ];

  List<bool> isCompleted = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text("Applied Job Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Track Application', style: TextStyles.font16Black),
              SizedBox(height: 20),
              AnotherStepper(
                stepperDirection: Axis.vertical,
                stepperList: List.generate(
                  stepperList.length,
                  (index) {
                    return StepperData(
                      iconWidget: GestureDetector(
                        onTap: () {
                          setState(() {
                            isCompleted[index] = !isCompleted[index];
                            if (isCompleted.every((element) => element)) {
                              Future.delayed(Duration(milliseconds: 300), () {
                                showDialog(
                                  // ignore: use_build_context_synchronously
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      " Winner 🎉",
                                      style: TextStyles.font22MainBlue,
                                    ),
                                    content: Text(
                                      textAlign: TextAlign.center,
                                      "You won the job with us!",
                                      style: TextStyles.font16Black,
                                    ),
                                    actions: [
                                      AppTextButton(
                                        buttonText: "Think",
                                        textStyle: TextStyles.font16White,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  ),
                                );
                              });
                            }
                          });
                        },
                        child: Icon(
                          isCompleted[index]
                              ? Icons.check_circle
                              : Icons.radio_button_checked_outlined,
                          color: isCompleted[index]
                              ? ColorsApp.mainBlue
                              : ColorsApp.darkBlue,
                        ),
                      ),
                      title: StepperText(
                        stepperList[index]["title"]!,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isCompleted[index]
                              ? ColorsApp.green
                              : ColorsApp.black,
                        ),
                      ),
                      subtitle: StepperText(
                        stepperList[index]["subtitle"]!,
                        textStyle: TextStyle(
                          color: isCompleted[index]
                              ? ColorsApp.green
                              : ColorsApp.gray,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}