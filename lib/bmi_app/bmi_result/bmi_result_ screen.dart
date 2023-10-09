// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
Color? mycolor;
class BMI_result_screen extends StatelessWidget {
final  double? result;
final  int? age;
  bool? gender=true;
  String?Weight_rate;
  BMI_result_screen(
      {
        @required this.age,
      @required this.gender,
        @required this.result,
      }
      ){
    getWeightrate();
  }
  void getWeightrate()
  {
    if(result!<=25&&result!>18)
      {
        Weight_rate="NormalWeight";
       mycolor=Colors.green;
      }
    else if(result!<=18)
      {
        Weight_rate=" Underweight";
        mycolor=Colors.blue;
      }else if(result!>25)
        {
          Weight_rate=" Overweight";
          mycolor=Colors.red;
        }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("BMI Result"),
        centerTitle: true,
        leading:IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:Icon(Icons.keyboard_arrow_left),
        ),
      ),
      body:Center(
        child: Container(
          width:350,
          height: 200,
          decoration: BoxDecoration(borderRadius:BorderRadius.circular(30),color:Colors.grey[400]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Gender : ${ gender!? 'Male' : 'Fmale'}',style:TextStyle(fontSize: 25,
                  fontWeight:FontWeight.bold),),
              SizedBox(height: 20,),
              Text("BMI is ${Weight_rate} : ${result?.round()}",style:TextStyle(fontSize: 25,
                  fontWeight:FontWeight.bold,
                color: mycolor,
              ),),
              SizedBox(height: 20,),
              Text("Age : $age",style:TextStyle(fontSize: 25,
                  fontWeight:FontWeight.bold),),

            ],
          ),

        ),
      ),
    );
  }
}
