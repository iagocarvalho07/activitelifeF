import 'dart:math';

import 'package:activitelifef/data/repositorys/database_repository_abstract.dart';
import 'package:activitelifef/data/models/user_model_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseRespositoryImplementation implements DataBaseRepositoryAbstract {
  final _currentUserUid = FirebaseAuth.instance.currentUser!.uid;
  final _db = FirebaseFirestore.instance;

  @override
  Future<UserModelEntity?> getUserEntityFromFireBase() async {
    final docRef = _db.collection("User").doc(_currentUserUid);
    final documentSnapshot = await docRef.get();
    if (!documentSnapshot.exists) {
      return null;
    }
    final doc = documentSnapshot.data();
    final userEntity = UserModelEntity.fromJson(doc!);
    return userEntity;
  }

  @override
  Future UpdateDataUser(String campo, String update) async {
    final updatedata = _db.collection('User').doc(_currentUserUid);
    updatedata.update({campo: update}).then(
        (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));
  }
}
