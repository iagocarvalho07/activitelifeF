import 'package:activitelifef/data/models/user_model_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../data/repositorys/database_repository_abstract.dart';
import '../../../widgets/drawer_menu.dart';
import 'bottom_sheet_updat.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  UserModelEntity? userModelEntity;

  Future _getUser() async {
    userModelEntity =
        await DataBaseRepositoryAbstract().getUserEntityFromFireBase();
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
    return Scaffold(
      appBar: AppBar(),
      drawer: const DrawerMenu(),
      body: Container(
        constraints: const BoxConstraints(
            minWidth: double.infinity, minHeight: double.infinity),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.settings,
                size: 50,
              ),
              const Text("configurações"),
              const Divider(thickness: 1.0),
              if (userModelEntity != null)
                SettingsChanges(context, userModelEntity!),
              if (userModelEntity == null) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget SettingsChanges(BuildContext context, UserModelEntity user) => Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person_pin),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text("Nome"), Text(user.Username)],
          ),
        ),
        ListTile(
          onTap: () => buildShowModalPerfilBottom(context, user.idade, 'idade'),
          leading: const Icon(Icons.cake),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Idade"), Text(user.idade)],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () => buildShowModalPerfilBottom(context, user.genero, 'genero'),
          leading: const Icon(Icons.transgender),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Gênero"), Text(user.genero)],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () => buildShowModalPerfilBottom(context, user.altura, 'altura'),
          leading: const Icon(Icons.height),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Altura"), Text(user.altura)],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () => buildShowModalPerfilBottom(context, user.peso, 'peso'),
          leading: const Icon(Icons.line_weight),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Peso"), Text(user.peso)],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.translate),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text("Idioma"), Text(user.idioma)],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        const Divider(
          thickness: 1.0,
        ),
        const Text("Configurações de treino"),
        ListTile(
          onTap: () => buildShowModalPerfilBottom(context, user.tempoTreino, 'tempoTreino'),
          leading: const Icon(Icons.timer),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text("Tempo de Treino"), Text(user.tempoTreino)],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () => buildShowModalPerfilBottom(context, user.experiencia, 'experiencia'),
          leading: const Icon(Icons.insights),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text("Experiencia"), Text(user.experiencia)],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () => buildShowModalPerfilBottom(context, user.frequencia, 'frequencia'),
          leading: const Icon(Icons.timelapse),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Frequencia de treinos"),
              Text("${user.frequencia}x/sem")
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () => buildShowModalPerfilBottom(context, user.objetivo, 'objetivo'),
          leading: const Icon(Icons.check_circle),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Objetivo"), Text(user.objetivo)],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        const Divider(thickness: 1.0),
        const Text("Ajude-nos"),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.star),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Seja Pro")],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.send_rounded),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Avalie-nos")],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.document_scanner_sharp),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Termos de Uso")],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.handshake),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Politica de Privacidade")],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
      ],
    );


