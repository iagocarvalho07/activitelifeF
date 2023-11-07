import 'package:activitelifef/data/models/user_model_entity.dart';
import 'package:activitelifef/utilits/navigation_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/repositorys/database_repository_abstract.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder(
            future: DataBaseRepositoryAbstract().getUserEntityFromFireBase(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return profile(context, snapshot.data!);
              } else if (snapshot.hasError) {
                return const Text('Erro ao carregar o perfil.');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}

Widget profile(BuildContext context, UserModelEntity userModelEntity) => Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.app_registration_outlined),
                    Text("Perfil")
                  ],
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoute.SettingsScreen);
                    },
                    child: const Row(
                      children: [
                        Text("Configurações"),
                        Icon(Icons.arrow_forward_rounded)
                      ],
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: 32,
                ),
                Text(
                  userModelEntity.Username,
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  userModelEntity.idade,
                  style: const TextStyle(fontSize: 24),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildItensProfile(context, const Icon(Icons.directions_walk),
                      userModelEntity.objetivo),
                  buildItensProfile(
                      context,
                      const Icon(Icons.h_mobiledata_outlined),
                      userModelEntity.peso),
                  buildItensProfile(
                      context,
                      const Icon(Icons.calendar_view_week),
                      userModelEntity.frequencia),
                ],
              ),
            )
          ],
        ),
      ),
    );

Widget buildItensProfile(BuildContext context, Icon iconss, String objetivo) =>
    Row(
      children: [iconss, Text(objetivo)],
    );
