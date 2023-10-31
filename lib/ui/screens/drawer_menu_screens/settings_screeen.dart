import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer_menu.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
              SettingsChanges(context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget SettingsChanges(BuildContext context) => Column(
      children: [
        ListTile(
          leading: Icon(Icons.person_pin),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Nome"), Text("UserName")],
          ),
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          leading: Icon(Icons.cake),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Idade"), Text("userIdade")],
          ),
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          leading: Icon(Icons.transgender),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Gênero"), Text("UserGender")],
          ),
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          leading: Icon(Icons.height),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Altura"), Text("UserHeigth")],
          ),
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          leading: Icon(Icons.line_weight),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Peso"), Text("UserPESO")],
          ),
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          leading: Icon(Icons.translate),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Idioma"), Text("SelectIdioma")],
          ),
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
        Divider(
          thickness: 1.0,
        ),
        Text("Configurações de treino"),
        ListTile(
          leading: Icon(Icons.timer),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Tempo de Treino"), Text("45 minutos")],
          ),
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          leading: Icon(Icons.insights),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Experiencia"), Text("Avançado")],
          ),
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          leading: Icon(Icons.timelapse),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Frequencia de treinos"), Text("5x/sem")],
          ),
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          leading: Icon(Icons.check_circle),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Objetivo"), Text("Ganho de massa")],
          ),
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
        Divider(thickness: 1.0),
        Text("Ajude-nos"),
        ListTile(
          leading: Icon(Icons.star),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Seja Pro")],
          ),
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          leading: Icon(Icons.send_rounded),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Avalie-nos")],
          ),
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          leading: Icon(Icons.document_scanner_sharp),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Termos de Uso")],
          ),
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          leading: Icon(Icons.handshake),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("Politica de Privacidade")],
          ),
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
      ],
    );
