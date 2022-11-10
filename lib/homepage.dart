import 'package:bmi_calc/main.dart';
import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff1283a6),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("BMI Calculator",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 60.0),),
            Positioned.fill(
                child: Opacity(
                  opacity: 0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                        'assets/images/bmi.png',
                        fit: BoxFit.cover,
                    width: 400.0 ,),
                  ),
                ),
              ), ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.redAccent,
          ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp())
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25,horizontal: 60),
                  child: Text('Calculator',style: TextStyle(color: Colors.white,fontSize: 20.0),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
