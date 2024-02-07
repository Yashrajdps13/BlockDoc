import 'package:flutter/material.dart';
import 'package:mongo_test/database/mongodb.dart';
import 'package:mongo_test/models/patients.dart';
import 'package:mongo_test/screens/add_patient_screen.dart';
import 'package:mongo_test/widgets/patient_card.dart';

class PatientsPage extends StatefulWidget {
  const PatientsPage({super.key});

  @override
  State<PatientsPage> createState() => PatientsPageState();
}

class PatientsPageState extends State<PatientsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MongoDatabase.getDocuments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: const LinearProgressIndicator(
                backgroundColor: Colors.black,
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Something went wrong, try again.',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(),
                body: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Column(children: [
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PATIENTS',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              Text(
                                'LIST',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFA957F3),
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: UserCard(
                                user: User.fromMap(snapshot.data![index]),
                                onTapDelete: () async {
                                  _deleteUser(
                                      User.fromMap(snapshot.data![index]));
                                },
                                onTapEdit: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return AddPatientPage();
                                      },
                                      settings: RouteSettings(
                                        arguments:
                                            User.fromMap(snapshot.data![index]),
                                      ),
                                    ),
                                  ).then((value) => setState(() {}));
                                },
                              ),
                            );
                          },
                          itemCount: snapshot.data?.length,
                        ),
                      )
                    ])),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return AddPatientPage();
                    })).then((value) => setState(() {}));
                  },
                  child: Icon(Icons.add),
                ),
              );
            }
          }
        });
  }

  _deleteUser(User user) async {
    await MongoDatabase.delete(user);
    setState(() {});
  }
}
