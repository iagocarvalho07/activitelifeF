import 'package:activitelifef/utilits/assets_constants.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/exercices_model_entity.dart';

class ExerceciesSceen extends StatefulWidget {
  const ExerceciesSceen({super.key});

  @override
  State<ExerceciesSceen> createState() => _ExerceciesSceenState();
}

class _ExerceciesSceenState extends State<ExerceciesSceen> {
  ExercicesModelEntity exercicesModelEntity = ExercicesModelEntity();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 19,
        itemBuilder: (context, index) => Column(
              children: [
                Text(index.toString()),
                cardExercices(context, exercicesModelEntity),
                const Divider(
                  thickness: 1,
                ),
              ],
            ));
  }
}

Widget cardExercices(
        BuildContext context, ExercicesModelEntity exercicesModelEntity) =>
    GestureDetector(
      onTap: () => showmodalBottomDetails(context, exercicesModelEntity),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AssetsPath.gitExempl,
                height: 60,
              ),
              const Column(
                children: [Text("dificult"), Text("Exercici Name")],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.star))
            ],
          ),
        ),
      ),
    );

Future showmodalBottomDetails(
        BuildContext context, ExercicesModelEntity exercicesModelEntity) =>
    showModalBottomSheet(
      backgroundColor: Colors.orange[100],
      showDragHandle: true,
      elevation: 2,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    exercicesModelEntity.gifUrl,
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Icon(Icons.light_mode),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(exercicesModelEntity.name),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 1),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(exercicesModelEntity.equipment),
                            Text(exercicesModelEntity.bodyPart),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(exercicesModelEntity.target),
                  const Divider(thickness: 1),
                  const Row(
                    children: [
                      Icon(Icons.change_circle_outlined),
                      Text("Alternativas"),
                    ],
                  ),
                  Container(
                      height: 100,
                      child: orizontalListView(context, exercicesModelEntity)),
                ],
              ),
            ),
          ),
        );
      },
    );

Widget orizontalListView(
        BuildContext context, ExercicesModelEntity exercicesModelEntity) =>
    ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Card(
              child: Column(
                children: [
                  Text(exercicesModelEntity.name),
                  Text(exercicesModelEntity.target),
                  Image.asset(
                    exercicesModelEntity.gifUrl,
                    height: 50,
                  ),
                ],
              ),
            ));
