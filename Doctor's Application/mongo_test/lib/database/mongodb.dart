import 'dart:async';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:mongo_test/database/constants.dart';
import 'package:mongo_test/models/patients.dart';

class MongoDatabase {
  static var db, collection;
  static connect() async {
    db = await Db.create(MONGO_URL);
    await db.open();
    collection = db.collection(COLLECTION_NAME);
    print(await collection.find().toList());
  }

  static Future<List<Map<String, dynamic>>> getDocuments() async {
    try {
      final users = await collection.find().toList();
      return users;
    } catch (e) {
      print(e);
      return Future.value(e as FutureOr<List<Map<String, dynamic>>>?);
    }
  }

  static insert(User user) async {
    await collection.insertAll([user.toMap()]);
  }

  static update(User user) async {
    var u = await collection.findOne({"_id": user.id});
    u["patient_name"] = user.patientName;
    u["patient_email"] = user.patientEmail;
    u["doctorn_name"] = user.doctorName;
    await collection.save(u);
  }

  static delete(User user) async {
    await collection.remove(where.id(user.id));
  }
}
