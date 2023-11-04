import 'package:activitelifef/data/models/user_model_entity.dart';
import 'package:activitelifef/domain/repositorys/database_repository_implementation.dart';

abstract class DataBaseRepositoryAbstract {
  Future getUserEntityFromFireBase() async {}

  factory DataBaseRepositoryAbstract() {
    return DataBaseRespositoryImplementation();
  }
}
