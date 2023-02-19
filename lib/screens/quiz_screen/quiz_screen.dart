// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/progress_timer.dart';
import 'package:quiz_app/widgets/question_card.dart';

import '../../controller/quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);
  static const routeName = '/quiz_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //     image: AssetImage('assets/images/here.jpg'),
                  //     fit: BoxFit.cover),
                  color: Colors.black87),
            ),
            SafeArea(
              child: GetBuilder<QuizController>(
                init: QuizController(),
                builder: (controller) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Question ',
                                style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                // style: Theme.of(context)
                                //     .textTheme
                                //     .headline4!
                                //     .copyWith(color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: controller.numberOfQuestion
                                        .round()
                                        .toString(),
                                    style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    // style: Theme.of(context)
                                    //     .textTheme
                                    //     .headline4!
                                    //     .copyWith(color: Colors.white)
                                  ),
                                  TextSpan(
                                    text: '/',
                                    style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    // style: Theme.of(context)
                                    //     .textTheme
                                    //     .headline5!
                                    //     .copyWith(color: Colors.white)
                                  ),
                                  TextSpan(
                                    text: controller.countOfQuestion.toString(),
                                    style: GoogleFonts.rubik(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    // style: Theme.of(context)
                                    //     .textTheme
                                    //     .headline5!
                                    //     .copyWith(color: Colors.white)
                                  ),
                                ]),
                          ),
                          ProgressTimer(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 450,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => QuestionCard(
                          questionModel: controller.questionsList[index],
                        ),
                        controller: controller.pageController,
                        itemCount: controller.questionsList.length,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Image.asset(
                    //   "assets/images/shf.png",
                    //   height: 250,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GetBuilder<QuizController>(
        init: QuizController(),
        builder: (controller) => CustomButton(
            onPressed: () => controller.nextQuestion(), text: 'Next'),
      ),
    );
  }
}
