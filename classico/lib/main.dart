import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key:key);

  // this widget is the root of the application
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Nikisha didi don",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}): super(key:key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var principal= TextEditingController();
  var rate= TextEditingController();
  var tenure= TextEditingController();

  String result="";
  void clear(){
    principal.clear();
    rate.clear();
    tenure.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(

          color: Colors.black,
          height: double.infinity,
          width: double.infinity,

          child: Stack(children: [
            Positioned(
              top: 150,
              left: 10,
              right: 10,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(color: Color.fromRGBO(224, 192, 199, 20),
                      borderRadius: BorderRadius.circular(25)),

                  height: 400,
                  width: double.infinity,
                ),
              ),
            ),
            Positioned(
              top: 360,
              left: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color.fromRGBO(199, 185, 197, 120),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)
                      )),
                  height: 110,
                  width: double.infinity,
                ),
              ),
            ),
            Positioned(
              top: 630,
              left: 10,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(color:  Color.fromRGBO(224, 192, 199, 20),
                      borderRadius: BorderRadius.circular(25)),

                ),
              ),
            ),
            Positioned(
              top: 490,
              left: 220,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){

                    double A = 0.0;
                    int P = int.parse(principal.text);
                    double r = int.parse(rate.text) / 12 / 100;
                    int t = int.parse(tenure.text);

                    if (P==0) {
                      showDialog(context: context, builder: (context){
                        return Container(
                          child: AlertDialog(
                            title: Text("The value can't be zero"),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                                principal.clear();
                              }, child: Text("Okay"))
                            ],
                          ),
                        );


                      });

                    }



                    else if(P<0){
                      showDialog(context: context, builder: (context){
                        return Container(
                          child: AlertDialog(
                            title: Text("The value is wrong"),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                                principal.clear();
                              }, child: Text("Okay"))
                            ],
                          ),
                        );


                      });

                    }

                    else if(int.parse(rate.text)>=100){
                      showDialog(context: context, builder: (context){
                        return Container(
                          child: AlertDialog(
                            title: Text("Rate can't be more than 100"),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                                rate.clear();
                              }, child: Text("Okay"))
                            ],
                          ),
                        );


                      });
                    }

                    else if(int.parse(rate.text)<=0){
                      showDialog(context: context, builder: (context){
                        return Container(
                          child: AlertDialog(
                            title: Text("Rate must be greater than zero"),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                                rate.clear();
                              }, child: Text("Okay"))
                            ],
                          ),
                        );


                      });
                    }

                    else if(int.parse(tenure.text)<=0){
                      showDialog(context: context, builder: (context){
                        return Container(
                          child: AlertDialog(
                            title: Text("Time must be greater than zero"),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                                tenure.clear();
                              }, child: Text("Okay"))
                            ],
                          ),
                        );


                      });
                    }

                    else{A = (P * r * pow((1+r), t) / ( pow((1+r),t) -1));
                    result = A.toStringAsFixed(2);

                    print("apple,$A");};

                    setState(() {

                    });
                  },
                  child: Container(
                    height: 45,
                    width: 120,
                    decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text("Calculate", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 18),)),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 490,
              left: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    clear();
                  },
                  child: Container(
                    height: 45,
                    width: 120,
                    decoration: BoxDecoration(color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text("Clear", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 50,
              left:10,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  width: 200,
                  child: Text("EMI Calculator", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),),

                ),
              ),
            ),
            const Positioned(
              top: 170,
              left: 20,

              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: Text("Principal Amount", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            const Positioned(
              top: 370  ,
              left: 20,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: Text("Tenure(Months)", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            const Positioned(
              top: 260,
              left: 20,

              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: Text("Interest Rate", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            Positioned(
              top: 700,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(


                  height:50,
                  width: 400,
                  child: Center(child: Text("Your monthly EMI is $result ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),)),
                ),
              ),
            ),
            Positioned(
              top: 220,
              left: 40,
              child: SizedBox(
                height: 20,
                width: 100,
                child: TextField(
                  controller: principal,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "Enter Amount",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
                      border: InputBorder.none

                  ),
                ),
              ),
            ),

            Positioned(
              top: 310,
              left: 40,
              child: SizedBox(
                height: 20,
                width: 100,
                child: TextField(
                  controller: rate,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "Enter Rate",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
                      border: InputBorder.none

                  ),
                ),
              ),
            ),

            Positioned(
              top: 420,
              left: 40,
              child: SizedBox(
                height: 20,
                width: 100,
                child: TextField(
                  controller: tenure,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "Enter Tenure",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.normal),
                      border: InputBorder.none

                  ),
                ),
              ),
            ),




          ],),
        )
    );
  }
}