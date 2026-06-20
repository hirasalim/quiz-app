


import 'package:app/home.dart';
import 'package:app/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Result extends StatelessWidget {
  final int correctAns;
  final int incorrectAns;

  const Result({
    super.key,
    required this.correctAns,
    required this.incorrectAns,
  });

  @override
  Widget build(BuildContext context) {
    double percen = (correctAns / 10) * 100;

    return Scaffold(
      body:Stack(
        children: [
           Positioned.fill(
            child: SingleChildScrollView(
             child: Container(
             
              
              child: Column(
                children: [
                  Lottie.network("https://lottie.host/b5652128-2c18-401b-8508-c6c3f12732d1/Mgqd1WoLib.json"),
                ],
              )),
           )),
          
      
       Positioned.fill(
         child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Text(
                    "🎉 CONGRATULATIONS 🎉",
                    style: GoogleFonts.rubik(  fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,),
                  ),
              
                  const SizedBox(height: 30),
              
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Text(
                     '${percen.toString()}%',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              
                  const SizedBox(height: 40),
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    
                      Container(
                        height: 100,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Correct",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              correctAns.toString(),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
              
                      // Incorrect Answer Box
                      Container(
                        height: 100,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Incorrect",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              incorrectAns.toString(),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              
                  const Spacer(),
                      InkWell(onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage(),)),
                        child: Container(
                                      height: 100,
                                      width: 140,
                                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Center(
                        child: Text(
                         "Try Again",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                                      ),
                                    ),
                      ),
                   const Spacer(),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Thanks for Playing!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
       ),
      ],)
    );
  }
}
