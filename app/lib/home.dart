
import 'package:app/api.dart';
import 'package:app/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int correctAns = 0;
  int incorrectAns = 0;

  int questionIndex = 0;
  List<dynamic> optionlist = [];
  List<Color> optionColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  Future<dynamic>? quizData;
  List<dynamic>? questions;
  bool isAnswered = false;

  @override
  void initState() {
    super.initState();
    quizData = getquestion();
  }

  void resetOptionColors() {
    optionColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }

  void setupOptionsForQuestion(List<dynamic> data) {
    optionlist = List.from(data[questionIndex]["incorrect_answers"]);
    optionlist.add(data[questionIndex]["correct_answer"]);
    optionlist.shuffle();
  }

  void nextQuestion() {
    if (questions != null && questionIndex < questions!.length - 1) {
      setState(() {
        questionIndex++;
        optionlist.clear();
        resetOptionColors();
        isAnswered = false;
      });
    }
  }

  void resultPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Result(
          correctAns: correctAns,
          incorrectAns: incorrectAns,
        ),
      ),
    );
  }

  void showCorrectAnswer(String correctAnswer) {
    for (int i = 0; i < optionlist.length; i++) {
      if (optionlist[i].toString() == correctAnswer) {
        optionColor[i] = Colors.green;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: SafeArea(
        child: Column(
          children: [
            if (quizData != null)
              FutureBuilder(
                future: quizData,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data["results"];
                    questions = data;

                    if (optionlist.isEmpty) {
                      setupOptionsForQuestion(data);
                    }

                    double progress = (questionIndex + 1) / data.length;

                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Progress Bar
                            LinearProgressIndicator(
                              value: progress,
                              backgroundColor: Colors.white,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                            ),
                            SizedBox(height: 20),

                            // Header
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Question ${questionIndex + 1}/${data.length}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  "Score: $correctAns",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),

                            // Question Card
                            Card(
                              elevation: 70,
                              color: Colors.yellow[300],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  data[questionIndex]["question"].toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),

                            // Options
                            Expanded(
                              child: ListView.builder(
                                itemCount: optionlist.length,
                                itemBuilder: (context, optionIndex) {
                                  var correctOption =
                                      data[questionIndex]["correct_answer"];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: GestureDetector(
                                      onTap: isAnswered
                                          ? null
                                          : () {
                                              setState(() {
                                                isAnswered = true;
                                                if (optionlist[optionIndex] ==
                                                    correctOption) {
                                                  optionColor[optionIndex] =
                                                      Colors.green;
                                                  correctAns++;
                                                } else {
                                                  optionColor[optionIndex] =
                                                      Colors.red;
                                                  incorrectAns++;
                                                  showCorrectAnswer(correctOption);
                                                }
                                              });
                                            },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                        decoration: BoxDecoration(
                                          color: optionColor[optionIndex],
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.black26),
                                        ),
                                        padding: const EdgeInsets.all(16),
                                        child: Text(
                                          optionlist[optionIndex].toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            // Next/Finish Button
                            if (isAnswered)
                              Center(
                                child: ElevatedButton(
                                  onPressed: questionIndex < data.length - 1
                                      ? nextQuestion
                                      : resultPage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange[700],
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    questionIndex < data.length - 1
                                        ? "Next Question"
                                        : "Finish Quiz",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          "Error loading quiz",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.orange),
                      ),
                    );
                  }
                },
              )
            else
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(color: Colors.orange),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
