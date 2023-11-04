import 'package:activitelifef/data/expections/firebase_auth_execption.dart';
import 'package:activitelifef/data/models/user_model_entity.dart';
import 'package:activitelifef/data/repositorys/respostiroty_abstract.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RepositoryImplementation implements RepositoryAuthenticatonWithFireBase {
  final db = FirebaseFirestore.instance;
  late AuthResultStatus _status;
  final _auth = FirebaseAuth.instance;


  @override
  Future<AuthResultStatus> CreatUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    final userModelEntity = UserModelEntity(
      Username: name,
      idade: '',
      genero: '',
      altura: '',
      peso: '',
      idioma: '',
      tempoTreino: '',
      experiencia: '',
      frequencia: '',
      objetivo: '',
    );
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (credential.user?.uid != null) {
        saveUserInDataBase(userModelEntity, String, credential.user!.uid);
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  @override
  Future<AuthResultStatus> LoginWithEmailAndPassword(
      String email, String password) async {
    try {
      final authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (authResult.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  @override
  Logout() {
    _auth.signOut();
  }

  @override
  resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  confirmEmail() {
    // TODO: implement confirmEmail
    throw UnimplementedError();
  }

  saveUserInDataBase(UserModelEntity userModelEntity, String, userId) {
    db.collection('User').doc(userId).set({
      'Username': userModelEntity.Username,
      'idade': userModelEntity.idade,
      'genero': userModelEntity.genero,
      'altura': userModelEntity.altura,
      'peso': userModelEntity.peso,
      'idioma': userModelEntity.idioma,
      'tempoTreino': userModelEntity.tempoTreino,
      'experiencia': userModelEntity.experiencia,
      'frequencia': userModelEntity.frequencia,
      'objetivo': userModelEntity.objetivo,
    });
  }
}
