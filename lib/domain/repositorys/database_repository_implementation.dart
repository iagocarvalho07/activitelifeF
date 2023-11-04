import 'package:activitelifef/data/repositorys/database_repository_abstract.dart';
import 'package:activitelifef/data/models/user_model_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseRespositoryImplementation implements DataBaseRepositoryAbstract {
  final _currentUserUid = FirebaseAuth.instance.currentUser!.uid;
  final _db = FirebaseFirestore.instance;
  late UserModelEntity userModelEntity;

  @override
  Future<UserModelEntity?> getUserEntityFromFireBase() async {
    final docRef = _db.collection("User").doc(_currentUserUid);
    // const source = Source.cache;
    final documentSnapshot = await docRef.get();
    if (!documentSnapshot.exists) {
      return null;
    }
    final doc = documentSnapshot.data();
    final userEntity = UserModelEntity.fromJson(doc!);
    userModelEntity = userEntity;
    print(userEntity.Username);
    return userEntity;
  }
}
