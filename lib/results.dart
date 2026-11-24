import 'package:flutter/material.dart';
import 'input.dart';



class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.bmi});
  
  final double bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:cardColor,
        title: Center(
          child: Text('BMI Calculator', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Container(
        color: cardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Your Bmi Results ',
                    style: TextStyle(
                      fontSize: 35,
                    ),),
                  Text('$bmi',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),),
                ],
              ),
            ),
            TextButton(
              child: Container(
                color: bottColor,
                width: double.infinity,
                child:  Center(
                  child: Text('RE-CALCULATE',
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:  (context){
                  return MyHomePage();
                }));
              }
            )


          ],
        ),
      ),

    );
  }
}
