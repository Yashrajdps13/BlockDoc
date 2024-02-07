import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mongo_test/database/mongodb.dart';
import 'package:mongo_test/routes/mapping.dart';
import 'package:mongo_test/screens/add_patient_screen.dart';
import 'package:mongo_test/screens/home_screen.dart';
import 'package:mongo_test/screens/patients_screen.dart';
import 'package:mongo_test/screens/predict_screen.dart';
import 'package:mongo_test/screens/summary_screen.dart';
import 'package:mongo_test/screens/upload_report_screan.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // WebView.platform = SurfaceAndroidWebView();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      "/": (context) => HomePage(),
      MyRoutes.addPatientRoute: (context) => AddPatientPage(),
      MyRoutes.patientsRoute: (context) => PatientsPage(),
      MyRoutes.uploadReportRoute: (context) => UploadReportPage(),
      MyRoutes.predictRoute: (context) => PredictPage(),
      MyRoutes.summaryRoute: (context) => SummaryPage(),
    });
  }
}
