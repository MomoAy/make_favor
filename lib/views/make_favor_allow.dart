import 'package:flutter/material.dart';

import '../repository/favor_repository.dart';

class make_favor_allow extends StatefulWidget {
  const make_favor_allow({super.key});

  @override
  State<make_favor_allow> createState() => _make_favor_allowState();
}

class _make_favor_allowState extends State<make_favor_allow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.brown),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 2,
          height: 50,
          child: const Text(
            "Liste des faveus acceptées",
              style: TextStyle(
                color: Colors.white,
              )
          ),
        ),
                const SizedBox(height: 18),
        Expanded(
          child: ListView(
              children: FavorRepository.favorList
                  .where((favor) => favor.statut == 1)
                  .map((favor) => Card(
                        child: ListTile(
                              title: Text(favor.motif.toString()),
                              subtitle: Text(favor.description.toString()),
                              leading: const CircleAvatar(
                                  child: Image(
                                image: AssetImage("assets/logo.png"),
                              )),
                            ),
                      ))
                  .toList()),
        )
      ]),
    );
  }
}
