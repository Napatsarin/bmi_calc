import 'package:flutter/material.dart';
void main() => runApp(
    MaterialApp(
      theme: ThemeData(
          primaryColor:Color(0xff1248a6)
      ),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height=170.0;
  double _weight=75.0;
  int _bmi=0;
  String _condition='Select Data';
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height*0.40,
              width: double.infinity,
              decoration: new BoxDecoration(color: Color(0xff127fa6)),
              padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(" BMI Calculator",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 60.0),),
                  Text("  คำนวณหาค่าดัชนีมวลกาย",style: TextStyle(color: Colors.white,fontSize: 30.0),),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child:Text("$_bmi",
                        style:TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 45.0
                        ),textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "   เกณท์ : ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_condition",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),)
                        ]
                    ),

                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height*0.03,),
                  Text("เลือกข้อมูล",style: TextStyle(color: Color(0xff1283a6),fontSize: 30.0,fontWeight: FontWeight.bold),),
                  SizedBox(height: size.height*0.03,),
                  RichText(
                    text: TextSpan(
                        text: "ส่วนสูง : ",
                        style: TextStyle(
                            color: Color(0xFF403f3d),
                            fontSize: 25.0
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_height เซนติเมตร",
                            style: TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),)
                        ]
                    ),

                  ),
                  SizedBox(height: size.height*0.03,),
                  Slider(
                    value: _height,
                    min:0,
                    max: 250,
                    onChanged: (height){
                      setState(() {
                        _height=height;
                      });
                    },
                    divisions: 250,
                    label: "$_height",
                    activeColor:Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(height: size.height*0.03,),
                  RichText(
                    text: TextSpan(
                        text: "น้ำหนัก : ",
                        style: TextStyle(
                            color: Color(0xFF403f3d),
                            fontSize: 25.0
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_weight กิโลกรัม",
                            style: TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),)
                        ]
                    ),

                  ),
                  SizedBox(height: size.height*0.03,),
                  Slider(
                    value: _weight,
                    min:0,
                    max: 300,
                    onChanged: (weight){
                      setState(() {
                        _weight=weight;
                      });
                    },
                    divisions: 300,
                    label: "$_weight",
                    activeColor:Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(height: size.height*0.03,),
                  Container(
                    width: size.width*0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: FlatButton(
                        onPressed: (){
                          setState(() {
                            //18.5 - 25 Healthy 25-30 Overweight >30 Obesity
                            _bmi=(_weight/((_height/100)*(_height/100))).round().toInt();
                            if(_bmi>=18.5 && _bmi<=25) {_condition=" ปกติ";}
                            else if(_bmi>25 && _bmi<=30) {_condition=" น้ำหนักเกินเกณฑ์";}
                            else if(_bmi>30) {_condition=" โรคอ้วน";}
                            else  {_condition=" น้ำหนักน้อยกว่าเกณฑ์";}
                          });
                        },
                        child: Text("คำนวณ",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                        color:Color(0xff1283a6),
                        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}