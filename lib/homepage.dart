import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  TextEditingController weightController=TextEditingController();
  TextEditingController HeightController=TextEditingController();
   String bmiResult='';
  String bmi='';

  void calculateBMI(String weight,String height){
 String WeightDouble=double.parse(weight);
  String  HeightDouble=double.parse(height);
  
    bmi=(weightDouble / (heightDouble * heightDouble)).toStringAsFixed(factionDigits:2);
    var bmiCategory=getCategory(bmi);
    bmiResult="You are in $bmiCategory category.";
  
  }

  String getCategory(String bmi){
    var bmiDouble=double.parse(bmi);
    var category='';
    if(bmiDouble <18.5){
      category='UnderWeight';
    }else if(18.5 <= bmiDouble && bmiDouble <24.9){
      category ='Healthy';
    }else if(bmiDouble >25 && bmiDouble <=29){
      category='OverWeight';

    }else{
      category='Obese';
    }
    return category;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 99, 146),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              "BMI Calculator",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 50),
          SizedBox(
            height: 90,
            width: 300,
            child: TextField(
              controller: weightController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Weight here (in kg)")),
            ),
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: TextField(
              controller: HeightController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Height here (in m)")),
            ),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 243, 232, 129),
              ),
              child: Center(
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            height: 70,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 248, 248, 245),
            ),
            child: Center(
              child: Text(
                "BMI: 29.30",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(),
        ],
      ),
    );
  }
}
