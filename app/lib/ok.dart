// import 'package:app/api.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var questionIndex = 0;
//   var optionlist = [];
//   var optionColor = [
//     Colors.white,
//     Colors.white,
//     Colors.white,
//     Colors.white,
//   ];
//   var score = 0;
//   Future<dynamic>? quizData;
//   List<dynamic>? questions;
//   bool isAnswered = false;

//   @override
//   void initState() {
//     super.initState();
//     quizData = getquestion();
//   }

//   void resetOptionColors() {
//     optionColor = [
//       Colors.white,
//       Colors.white,
//       Colors.white,
//       Colors.white,
//     ];
//   }

//   // ✅ FIXED Score function
//   void Score(String selectedAnswer, String correctAnswer) {
//     if (selectedAnswer == correctAnswer) {
//       setState(() {
//         score++;
//       });
//     }
//   }

//   void setupOptionsForQuestion(List<dynamic> data) {
//     optionlist = List.from(data[questionIndex]["incorrect_answers"]);
//     optionlist.add(data[questionIndex]["correct_answer"]);
//     optionlist.shuffle();
//   }

//   void nextQuestion() {
//     if (questions != null && questionIndex < questions!.length - 1) {
//       setState(() {
//         questionIndex++;
//         optionlist.clear();
//         resetOptionColors();
//         isAnswered = false;
//       });
//     }
//   }

//   void showCorrectAnswer(String correctAnswer) {
//     setState(() {
//       for (int i = 0; i < optionlist.length; i++) {
//         if (optionlist[i].toString() == correctAnswer) {
//           optionColor[i] = Colors.green;
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           if (quizData != null)
//             FutureBuilder(
//               future: quizData,
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.hasData) {
//                   final data = snapshot.data["results"];
//                   questions = data;

//                   if (optionlist.isEmpty) {
//                     setupOptionsForQuestion(data);
//                   }

//                   return Expanded(
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Text(
//                                 "Question ${questionIndex + 1} of ${data.length}",
//                                 style: TextStyle(
//                                   color: Colors.white70,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                             Spacer(),
//                             Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Text(
//                                 "Score: $score",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Text(
//                             data[questionIndex]["question"],
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w500,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         Expanded(
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             itemCount: optionlist.length,
//                             itemBuilder: (context, optionIndex) {
//                               var correctOption =
//                                   data[questionIndex]["correct_answer"];
//                               return Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 16.0,
//                                   vertical: 8.0,
//                                 ),
//                                 child: GestureDetector(
//                                   onTap: isAnswered
//                                       ? null
//                                       : () {
//                                           setState(() {
//                                             isAnswered = true;
//                                             if (correctOption.toString() ==
//                                                 optionlist[optionIndex]
//                                                     .toString()) {
//                                               optionColor[optionIndex] =
//                                                   Colors.green;

//                                               /// ✅ Call Score function here
//                                               Score(
//                                                 optionlist[optionIndex]
//                                                     .toString(),
//                                                 correctOption.toString(),
//                                               );
//                                             } else {
//                                               optionColor[optionIndex] =
//                                                   Colors.red;
//                                               showCorrectAnswer(
//                                                   correctOption.toString());
//                                             }
//                                           });
//                                         },
//                                   child: Container(
//                                     height: 60,
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       color: optionColor[optionIndex],
//                                       border: Border.all(
//                                         color: Colors.grey,
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     child: Center(
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(12.0),
//                                         child: Text(
//                                           optionlist[optionIndex].toString(),
//                                           style: TextStyle(
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 16,
//                                           ),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         if (isAnswered)
//                           Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: ElevatedButton(
//                               onPressed: questionIndex < data.length - 1
//                                   ? nextQuestion
//                                   : null,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue,
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: 40,
//                                   vertical: 15,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               child: Text(
//                                 questionIndex < data.length - 1
//                                     ? "Next Question"
//                                     : "Quiz Complete",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   );
//                 } else if (snapshot.hasError) {
//                   return Expanded(
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.error_outline,
//                             color: Colors.red,
//                             size: 60,
//                           ),
//                           SizedBox(height: 16),
//                           Text(
//                             "Error loading quiz",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 quizData = getquestion();
//                               });
//                             },
//                             child: Text("Retry"),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 } else {
//                   return Expanded(
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CircularProgressIndicator(
//                             color: Colors.white,
//                           ),
//                           SizedBox(height: 16),
//                           Text(
//                             "Loading quiz...",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               },
//             )
//           else
//             Expanded(
//               child: Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
