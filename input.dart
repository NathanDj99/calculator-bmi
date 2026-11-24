import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'results.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const bottomHeight = 80.0;
const cardColor = Color(0xFF1D1E33);
const bottColor = Color(0xFFEB1555);
const clickColor = Color(0XFF111328);
int ageCount = 0;
int weightCount = 0;


enum Gender  {
  male,
  female
}


double height = 170;
bool heightChanged = false;




class _MyHomePageState extends State<MyHomePage> {
  Gender? selectedGender;

  void calc(){
    if(conditionsMet()){
      double bmi = weightCount / ((height / 100) * (height / 100));

      Navigator.push(context, MaterialPageRoute(builder:  (context){
        return ResultsPage(bmi: bmi,);
      }));
    }
  }

  bool conditionsMet(){
    return selectedGender != null &&
    heightChanged == true &&
    weightCount  != 0 &&
    ageCount  != 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:cardColor,
        title: Center(
          child: Text('BMI Calculator', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:  Reusable(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour : selectedGender == Gender.male ? clickColor : cardColor,
                    cardWidget:  RewindColumn(
                      icon: Icons.male,
                      gender: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child:  Reusable(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                    },
                    colour : selectedGender == Gender.female ? clickColor : cardColor,
                      cardWidget:  RewindColumn(
                        icon: Icons.female,
                        gender: 'Female',
                      )
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:  Container(
              margin: EdgeInsets.all(15),
              color: heightChanged == false ? cardColor : clickColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Height',
                              style:  TextStyle(fontSize: 20),
                            ),
                            Row(
                              children: [
                                Text('${height.round()}', style:  TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                                Text('cm', style:  TextStyle(fontSize: 20),),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Reusable(
                    onPress: (){
                    },
                    colour: heightChanged == true ? clickColor : cardColor,
                    cardWidget: Slider(
                      value: height,
                      min: 1,
                      max: 250,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.roundToDouble();
                          heightChanged = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:  Reusable(
                    onPress: (){},
                    colour: ageCount > 0 ? clickColor : cardColor,
                      cardWidget:  Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Age",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                TextButton(onPressed: (){
                                  setState(() {
                                    ageCount++;
                                });
                                }, child: Text("+",
                                  style: TextStyle(
                                    fontSize: 220,
                                  ),
                                ),
                                ),
                                Row(
                                  children: [
                                    Text('$ageCount ',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),),
                                      Text("yrs",
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),),
                                  ],
                                ),
                                TextButton(onPressed: (){
                                  setState(() {
                                    ageCount = ageCount > 0 ? ageCount - 1: 0;
                                  });
                                }, child: Text("-",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )                            )                        ],
                            ),
                          ],
                        ),
                      ),
                  ),                ),
                Expanded(
                  child:  Reusable(
                    onPress: (){},
                    colour: weightCount > 0 ? clickColor : cardColor,
                    cardWidget:  Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Weight",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              TextButton(onPressed: (){
                                setState(() {
                                  weightCount++;
                                });
                              }, child: Text("+",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )
                              ),
                              Row(
                                children: [
                                  Text('$weightCount ',
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),

                                ],
                              ),
                              TextButton(onPressed: (){
                                setState(() {
                                  weightCount = weightCount > 0 ? weightCount-1 : 0;
                                });
                              }, child: Text("-",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )                            )                        ],
                          ),
                        ],
                      ),
                    ),
                  ),                ),
              ],
            ),
          ),
          TextButton(
            child: Container(
              color: bottColor,
              width: double.infinity,
              height: bottomHeight,
              child: Center(
                child: Text('Calculate',
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
            ),onPressed: (){
              calc();
              },

          )
        ],
      ),
    );
  }
}


class Reusable extends StatelessWidget {

  const Reusable({super.key, required this.colour, required this.cardWidget, required this.onPress});
  final Color colour;
  final Widget cardWidget;
  final VoidCallback onPress;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardWidget,
      ),
    );
  }
}

