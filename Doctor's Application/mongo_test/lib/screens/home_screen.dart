import 'package:flutter/material.dart';
import 'package:mongo_test/routes/mapping.dart';
import 'package:mongo_test/widgets/drawer.dart';
import 'package:mongo_test/widgets/graph_element_breast.dart';
import 'package:mongo_test/widgets/graph_element_diabetes.dart';
import 'package:mongo_test/widgets/graph_element_heart.dart';
import 'package:mongo_test/widgets/graph_element_kidney.dart';
import 'package:mongo_test/widgets/graph_element_liver.dart';
import 'package:mongo_test/widgets/home_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 0.12 * (MediaQuery.of(context).size.width),
                right: 0.06 * (MediaQuery.of(context).size.width),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WELCOME TO',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                      Text(
                        'BLOCDOC',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA957F3),
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('lib/images/logo.png'),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.03 * (MediaQuery.of(context).size.height)),
            Container(
                width: 1 * (MediaQuery.of(context).size.width),
                height: 0.5 * (MediaQuery.of(context).size.height),
                decoration: BoxDecoration(
                  // color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(6.83),
                ),
                child: StepWiseHorizontalScroll()),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                          boxColor: 0xFFDFBDFE,
                          label: 'Upload Report',
                          image: 'lib/images/upload_icon.png',
                          route:
                              'https://srivas-divyansh.github.io/blockchain_bnb/',
                          isRoute: 0),
                      Spacer(),
                      MyButton(
                          boxColor: 0xFF8CF8B7,
                          label: 'Patients',
                          image: 'lib/images/patient_assigned.png',
                          route: MyRoutes.patientsRoute,
                          isRoute: 1),
                    ],
                  ),
                  SizedBox(height: 35),
                  Row(
                    children: [
                      MyButton(
                          boxColor: 0xFFFFF7AD,
                          label: 'Predict',
                          image: 'lib/images/predict.png',
                          route: 'https://diseasepredictionml-dl.onrender.com/',
                          isRoute: 0),
                      Spacer(),
                      MyButton(
                          boxColor: 0xFF95B2FB,
                          label: 'Summarizer',
                          image: 'lib/images/history.png',
                          route:
                              'https://textsummarybitnbuild-vpunyga6dgutxmdzuqkcca.streamlit.app/',
                          isRoute: 0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class StepWiseHorizontalScroll extends StatelessWidget {
  final List<dynamic> steps = [
    GraphElementBreast(),
    GraphElementDiabetes(),
    GraphElementKidney(),
    GraphElementHeart(),
    GraphElementLiver(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: steps.length,
      itemBuilder: (context, index) {
        return Container(
            width: 1 * (MediaQuery.of(context).size.width),
            height: 0.5 * (MediaQuery.of(context).size.height),
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(6.83),
            ),
            child: steps[index]);
      },
    );
  }
}
