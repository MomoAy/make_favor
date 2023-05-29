import 'package:flutter/material.dart';

import '../repository/favor_repository.dart';

class make_favor_refuse extends StatefulWidget {
  const make_favor_refuse({super.key});

  @override
  State<make_favor_refuse> createState() => _make_favor_refuseState();
}

class _make_favor_refuseState extends State<make_favor_refuse> {
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
            "Liste des faveus refusées",
              style: TextStyle(
                color: Colors.white,
              )
          ),
        ),
        Expanded(
          child: ListView(
              children: FavorRepository.favorList
                  .where((favor) => favor.statut == -1)
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