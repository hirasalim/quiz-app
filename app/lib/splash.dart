

import 'dart:async';



import 'package:app/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      

      child: Scaffold(backgroundColor: Colors.yellow,
          body:
           Column(
             children: [
              Lottie.network("https://lottie.host/ab89a356-1cef-49eb-9639-171085b43af0/tMx9dk4Itm.json"),
               Container(
                             height: 100,
                             width: 140,
                             decoration: BoxDecoration(
               color: Colors.white70,
               borderRadius: BorderRadius.circular(12),
                             ),
                             child: Center(
               child: Text(
                "Get Started",
                 style:GoogleFonts.aBeeZee(  fontSize: 16,
                   fontWeight: FontWeight.w600,)
               ),
                             ),
                           ),
           
             ],
           )
      ),
    );
  }
}



















//
   // , Center(
                
              //    child: Padding(
              //      padding: const EdgeInsets.only(top: 200),
              //      child: Stack
              //                (
              //       children: [
              //              Padding(
              //                padding: const EdgeInsets.only(top: 1),
              //                child: Icon(Icons.question_mark),
              //              ),
              //               Padding(
              //                padding: const EdgeInsets.only(left: 50,top: 110),
              //                child: Icon(Icons.question_mark_rounded,size: 30,weight: 60,),
              //              ),
              //              Padding(
              //                padding: const EdgeInsets.only(top: 100),
              //                child: Icon(Icons.settings,size: 30,),
              //              ),
                       
              //           Padding(
              //                padding: const EdgeInsets.only(left: 120,top: 80,),
              //                child: Icon(Icons.lightbulb,size: 30,),
              //              ), 
              //      Padding(
              //        padding: const EdgeInsets.only(top: 0),
              //        child: Transform.rotate(angle: 75,
              //          child: Container(
              //           height: 100,
              //          width: 150,
              //          color: Colors.white,
              //          child: Center(child: Text("Quiz App",style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold
              //          ),)),
                                       
                       
                       
                       
              //          ),
              //        ),
              //      ),
                    
                           
                         
              //              Padding(
              //                padding: const EdgeInsets.only(left: 130,),
              //                child: Icon(Icons.settings,size: 30,),
              //              ),
                                      
                                      
                         
                        
                      
              //            ]),
              //    ),
              //  ),
              
              //  SizedBox(height: 150,),
              //   Container(height: 20,
              //       width: 50,
              //       color: Colors.white,)