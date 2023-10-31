import 'package:activitelifef/utilits/navigation_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Profile(context),
        ],
      ),
    );
  }
}

Widget Profile(BuildContext context) => Card(
      child: Padding(
        padding: EdgeInsets.all(20),
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
                Icon(
                  Icons.person,
                  size: 32,
                ),
                Text(
                  "Iago Carvalho,",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "27",
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildItensProfile(context, const Icon(Icons.directions_walk), "Ganho de Massa"),
                  buildItensProfile(context, const Icon(Icons.h_mobiledata_outlined), "peso "),
                  buildItensProfile(context, const Icon(Icons.calendar_view_week), "Frequencia"),
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
