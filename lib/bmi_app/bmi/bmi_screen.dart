// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names
import 'dart:math';
import 'package:flutter/material.dart';
import '../bmi_result/bmi_result_ screen.dart';
class BmiScreen extends StatefulWidget
{
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int count_Weight=40;
  int count_age=20;
  double value_slider=120;
  bool is_male=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        //backgroundColor: Colors.black,
       // elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap:() {
                        setState(() {
                        is_male=true;
                        });
                      } ,
                      child: Container(
                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),
                        color:is_male? Colors.blue:Colors.grey[400],
                        ),
                        child:
                        Column(
                          children: [
                           Icon(Icons.male,
                           size: 90,
                           ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Man",
                              style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                        setState(() {
                          is_male=false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(borderRadius:BorderRadius.circular(20),
                          color:is_male?Colors.grey[400]:Colors.blue,
                        ),
                        child:
                        Column(
                          children: [
                            Icon(
                              Icons.female,
                              size: 90,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("Woman",
                              style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  child: Expanded(
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Height",
                          style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text("${value_slider.round()}",
                              style:TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
                            Text("cm",
                              style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        Slider(value:value_slider,
                            max: 220,
                            min: 80,
                            onChanged:(v){
                          setState(() {
                            value_slider=v;
                          });
                            }
                        )
                      ],
                    ),
                  ),
                  decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[400],)
                ),
              )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child:
                    Container(
                     decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),
                       color: Colors.grey[400],),
                      child:
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                      Text("Weight",
                        style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        Text('$count_Weight',
                          style:TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(onPressed:(){
                              setState(() {
                                if(count_Weight<=1) {
                                  count_Weight=1;
                                }else{
                                  count_Weight--;
                                }
                              });
                            },
                            child:Icon(Icons.remove),
                              heroTag: 'w-',
                            ),
                            SizedBox(width: 7,),
                            FloatingActionButton(onPressed:(){
                              setState(() {
                                count_Weight++;
                              });
                            },
                              child:Icon(Icons.add),
                              heroTag: 'g+',
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child:
                    Container(
                      decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[400],),
                      child:
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Text("Age",
                              style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                            Text("$count_age",
                              style:TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(onPressed:(){
                                  setState(() {
                                    if(count_age<=1) {
                                      count_age=1;
                                    }else{
                                      count_age--;
                                    }
                                  });
                                },
                                  child:Icon(Icons.remove),
                                  heroTag: 'g-',
                                ),
                                SizedBox(width: 7,),
                                FloatingActionButton(onPressed:(){
                                  setState(() {
                                    count_age++;
                                  });
                                },
                                  child:Icon(Icons.add),
                                  heroTag: 'g+',
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color:Colors.blue,
            width: double.infinity,
            child: MaterialButton(
                onPressed: (){
                   double result=count_Weight / pow(value_slider / 100,2);
                   Navigator.push(context,
                   MaterialPageRoute(builder: (context) {
                    return BMI_result_screen(
                   age:count_age,
                     result:result,
                     gender:is_male,
                   );
                   }
                   )
                   );
                },
              child:
              Text("Calculator",
                style:TextStyle(color:Colors.white,
                    fontWeight:FontWeight.bold,fontSize: 20),),
            ),
          )
        ],
      ),
    );
  }
}
