import 'package:activitelifef/domain/repositorys/repository_implementation.dart';

abstract class RepositoryAuthenticatonWithFireBase {
  Future<dynamic> LoginWithEmailAndPassword(String email, String Password) async {}

  Future<dynamic> CreatUserWithEmailAndPassword(
      String name, String email, String Password) async {}

  Logout(){}

  resetPassword(String email)async {}

  confirmEmail()async{}

  factory RepositoryAuthenticatonWithFireBase(){
    return RepositoryImplementation();
  }
}
