import 'package:flutter/material.dart';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:mongo_test/database/constants.dart';

// // class AddPatientPage extends StatefulWidget {
// //   const AddPatientPage({Key? key}) : super(key: key);

// //   @override
// //   State<AddPatientPage> createState() => _AddPatientPageState();
// // }

// // class _AddPatientPageState extends State<AddPatientPage> {
//   // final _patientNameController = TextEditingController();
//   // final _emailController = TextEditingController();
//   // final _doctorNameController = TextEditingController();

//   // Future<void> _addDetails() async {
//   //     var db = await Db.create(MONGO_URL);
//   //   await db.open();
//   //   var collection = db.collection(COLLECTION_NAME);
//   //     await collection.insertOne(
//   //     {
//   //       "Patient Name": _patientNameController.text,
//   //       "Patient email": _emailController.text,
//   //       "Doctor Name": _doctorNameController.text,
//   //     }
//   //     );
//   // }

// //   // @override
// //   // void dispose() {
// //   //   super.dispose();
// //   //   _emailController.dispose();
// //   //   _doctorNameController.dispose();
// //   //   _patientNameController.dispose();
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //           backgroundColor: Colors.white,
// //           elevation: 0.0,
// //           leading: IconButton(
// //             onPressed: () {
// //               Navigator.pop(context);
// //             },
// //             icon: Icon(
// //               Icons.arrow_back,
// //               color: Colors.black,
// //               size: 25,
// //             ),
// //           )),
// //       body: Padding(
// //           padding: EdgeInsets.symmetric(
// //             horizontal: MediaQuery.of(context).size.width * 0.05,
// //           ),
// //           child: Column(
// //             children: [
// //               Align(
// //                   alignment: Alignment.bottomLeft,
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'ADD PATIENT',
// //                         style: TextStyle(
// //                           fontSize: 28,
// //                           fontWeight: FontWeight.bold,
// //                           fontFamily: 'Inter',
// //                         ),
// //                       ),
// //                       Text(
// //                         'DETAILS',
// //                         style: TextStyle(
// //                           fontSize: 28,
// //                           fontWeight: FontWeight.bold,
// //                           color: Color(0xFFA957F3),
// //                           fontFamily: 'Inter',
// //                         ),
// //                       ),
// //                     ],
// //                   )),
// //               SizedBox(height: 25),
// //               SizedBox(
// //                 height: 52,
// //                 child: TextField(
// //                   controller: _patientNameController,
// //                   decoration: InputDecoration(
// //                     labelText: 'Patient Name',
// //                     labelStyle: const TextStyle(
// //                       color: Color(0xFF969696),
// //                     ),
// //                     enabledBorder: OutlineInputBorder(
// //                       borderSide: const BorderSide(
// //                         color: Colors.black87,
// //                       ),
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                     focusedBorder: OutlineInputBorder(
// //                       borderSide: const BorderSide(
// //                         color: Color(0xFF0A043C),
// //                       ),
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 25),
// //               SizedBox(
// //                 height: 52,
// //                 child: TextField(
// //                   controller: _emailController,
// //                   decoration: InputDecoration(
// //                     labelText: 'Patient Email',
// //                     labelStyle: const TextStyle(
// //                       color: Color(0xFF969696),
// //                     ),
// //                     enabledBorder: OutlineInputBorder(
// //                       borderSide: const BorderSide(
// //                         color: Colors.black87,
// //                       ),
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                     focusedBorder: OutlineInputBorder(
// //                       borderSide: const BorderSide(
// //                         color: Color(0xFF0A043C),
// //                       ),
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 25),
// //               SizedBox(
// //                 height: 52,
// //                 child: TextField(
// //                   controller: _doctorNameController,
// //                   decoration: InputDecoration(
// //                     labelText: 'Doctor Name',
// //                     labelStyle: const TextStyle(
// //                       color: Color(0xFF969696),
// //                     ),
// //                     enabledBorder: OutlineInputBorder(
// //                       borderSide: const BorderSide(
// //                         color: Colors.black87,
// //                       ),
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                     focusedBorder: OutlineInputBorder(
// //                       borderSide: const BorderSide(
// //                         color: Color(0xFF0A043C),
// //                       ),
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 25),
// //               SizedBox(
// //                 width: MediaQuery.of(context).size.width,
// //                 height: 46,
// //                 child: ElevatedButton(
// //                     style: ElevatedButton.styleFrom(
// //                       elevation: 0.0,
// //                       backgroundColor: const Color(0xFF1E293B),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(30),
// //                       ),
// //                     ),
// //                     child: const Text(
// //                       'Add Patient',
// //                       style: TextStyle(
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.w500,
// //                           color: Colors.white),
// //                     ),
// //                     onPressed: () {}),
// //               ),
// //             ],
// //           )),
// //     );

// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:mongo_dart/mongo_dart.dart';
// // import 'package:mongo_dart/mongo_dart.dart';

// import '../database/constants.dart';

// class AddPatientPage extends StatefulWidget {
//   const AddPatientPage({super.key});

//   @override
//   State<AddPatientPage> createState() => _AddPatientPageState();
// }

// class _AddPatientPageState extends State<AddPatientPage> {
//   final _patientNameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _doctorNameController = TextEditingController();

//   Future<void> _addDetails() async {
//      try {
//     if (_patientNameController.text == null ||
//         _doctorNameController.text == null ||
//         _emailController.text == null) {
//       // Handle the case where one or more fields are empty
//     } else {
//       var db = await Db(MONGO_URL);
//       await db.open();
//       var collection = db.collection(COLLECTION_NAME);
//       await collection.insertOne(
//         {
//           "Patient Name": _patientNameController.text,
//           "Patient email": _emailController.text,
//           "Doctor Name": _doctorNameController.text,
//         },
//       );
//     }
//   } catch (e) {
//     // Handle any exceptions here
//     print('Error: $e');
//   }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0.0,
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.black,
//               size: 25,
//             ),
//           )),
//       body: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: MediaQuery.of(context).size.width * 0.05,
//           ),
//           child: Column(
//             children: [
//               Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'ADD PATIENT',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Inter',
//                         ),
//                       ),
//                       Text(
//                         'DETAILS',
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFFA957F3),
//                           fontFamily: 'Inter',
//                         ),
//                       ),
//                     ],
//                   )),
//               SizedBox(height: 25),
//               SizedBox(
//                 height: 52,
//                 child: TextField(
//                   controller: _patientNameController,
//                   decoration: InputDecoration(
//                     labelText: 'Patient Name',
//                     labelStyle: const TextStyle(
//                       color: Color(0xFF969696),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Colors.black87,
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Color(0xFF0A043C),
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 25),
//               SizedBox(
//                 height: 52,
//                 child: TextField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Patient Email',
//                     labelStyle: const TextStyle(
//                       color: Color(0xFF969696),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Colors.black87,
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Color(0xFF0A043C),
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 25),
//               SizedBox(
//                 height: 52,
//                 child: TextField(
//                   controller: _doctorNameController,
//                   decoration: InputDecoration(
//                     labelText: 'Doctor Name',
//                     labelStyle: const TextStyle(
//                       color: Color(0xFF969696),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Colors.black87,
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Color(0xFF0A043C),
//                       ),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 25),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 46,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       elevation: 0.0,
//                       backgroundColor: const Color(0xFF1E293B),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                     child: const Text(
//                       'Add Patient',
//                       style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white),
//                     ),
//                     onPressed: () {}),
//               ),
//             ],
//           )),
//     );
//   }
// }

class AddPatientPage extends StatelessWidget {
  AddPatientPage({super.key});
  final _patientNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _doctorNameController = TextEditingController();

  Future<void> _addDetails() async {
    var db = await Db.create(MONGO_URL);
    await db.open();
    var collection = db.collection(COLLECTION_NAME);
    await collection.insertOne(
      {
        "patient_name": _patientNameController.text,
        "patient_email": _emailController.text,
        "doctor_name": _doctorNameController.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            ),
          )),
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ADD PATIENT',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                      Text(
                        'DETAILS',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA957F3),
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 25),
              SizedBox(
                height: 52,
                child: TextField(
                  controller: _patientNameController,
                  decoration: InputDecoration(
                    labelText: 'Patient Name',
                    labelStyle: const TextStyle(
                      color: Color(0xFF969696),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF0A043C),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                height: 52,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Patient Email',
                    labelStyle: const TextStyle(
                      color: Color(0xFF969696),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF0A043C),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                height: 52,
                child: TextField(
                  controller: _doctorNameController,
                  decoration: InputDecoration(
                    labelText: 'Doctor Name',
                    labelStyle: const TextStyle(
                      color: Color(0xFF969696),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF0A043C),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 46,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: const Color(0xFF1E293B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Add Patient',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    onPressed: _addDetails),
              ),
            ],
          )),
    );
  }
}
