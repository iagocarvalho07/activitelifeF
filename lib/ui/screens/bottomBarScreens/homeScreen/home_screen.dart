import 'package:activitelifef/data/models/user_model_entity.dart';
import 'package:flutter/cupertino.dart';

import '../../../../data/repositorys/database_repository_abstract.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModelEntity? userModelEntity;

  Future _getUser() async {
    userModelEntity = await DataBaseRepositoryAbstract().getUserEntityFromFireBase();
  }
  void _updateUser() async {
    await _getUser();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _updateUser();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(userModelEntity?.Username ?? ''),
      ],
    );
  }
}
