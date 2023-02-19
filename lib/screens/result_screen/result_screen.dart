// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/custom_button.dart';

import '../../constants.dart';
import '../../controller/quiz_controller.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);
  static const routeName = '/result_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back.jpg'), fit: BoxFit.cover),
          ),
        ),
        Center(
          child: GetBuilder<QuizController>(
            init: Get.find<QuizController>(),
            builder: (controller) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Congratulation',
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                    // style: Theme.of(context).textTheme.headline3!.copyWith(
                    //       color: Colors.white,
                    //     ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    controller.name,
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    )),
                    // style: Theme.of(context).textTheme.headline3!.copyWith(
                    //       color: kPrimaryColor,
                    //     ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Your Score is',
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                      fontSize: 30,
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                    // style: Theme.of(context).textTheme.headline4!.copyWith(
                    //       color: Colors.white,
                    //     ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '${controller.scoreResult.round()} /100',
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    )),
                    // style: Theme.of(context).textTheme.headline3!.copyWith(
                    //       color: kPrimaryColor,
                    //     ),
                  ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        onPressed: () => controller.startAgain(),
                        text: 'Start Again',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
