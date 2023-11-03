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
          leading: const Icon(Icons.person_pin),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Nome"), Text("UserName")],
          ),
        ),
        ListTile(
          onTap: () => buildShowModalPerfilBottom(context),
          leading: const Icon(Icons.cake),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Idade"), Text("userIdade")],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.transgender),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Gênero"), Text("UserGender")],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.height),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Altura"), Text("UserHeigth")],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.line_weight),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Peso"), Text("UserPESO")],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.translate),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Idioma"), Text("SelectIdioma")],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        const Divider(
          thickness: 1.0,
        ),
        const Text("Configurações de treino"),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.timer),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Tempo de Treino"), Text("45 minutos")],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.insights),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Experiencia"), Text("Avançado")],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.timelapse),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Frequencia de treinos"), Text("5x/sem")],
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(Icons.check_circle),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Objetivo"), Text("Ganho de massa")],
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

Future buildShowModalPerfilBottom(BuildContext context,) => showModalBottomSheet(
    showDragHandle: true,
    context: context,
    builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Center(
              child: Column(
                children: [
                  Text("data")

                ],
              ),
            ),
          ),
        ));
