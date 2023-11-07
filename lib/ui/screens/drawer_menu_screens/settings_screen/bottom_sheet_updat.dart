import 'package:activitelifef/data/repositorys/database_repository_abstract.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future buildShowModalPerfilBottom(BuildContext context, String user,
    String campo) =>
    showModalBottomSheet(
        showDragHandle: true,
        context: context,
        builder: (BuildContext context) =>
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Center(
                  child: Column(
                    children: [
                      const Text("Atualizar"),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                            decoration: const InputDecoration(
                              label: Text("Atualize seus Dados"),
                            ),
                            controller: TextEditingController(),
                            onSubmitted: (String value) {
                              DataBaseRepositoryAbstract()
                                  .UpdateDataUser(campo,value);
                              Navigator.pop(context);
                            }
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
