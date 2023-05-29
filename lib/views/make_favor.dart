import 'package:flutter/material.dart';

import '../models/favor.dart';
import '../repository/favor_repository.dart';

class MakeFavorPage extends StatefulWidget {
  const MakeFavorPage({super.key});

  @override
  State<MakeFavorPage> createState() => _MakeFavorPageState();
}

class _MakeFavorPageState extends State<MakeFavorPage> {
  String first = FavorRepository.nameList[0];
  String choiceValue = '';
  GlobalKey<FormState> keyForm = GlobalKey();
  DateTime? choiceDate;
  String? motif;
  String? contenu;
  TextEditingController motifController = TextEditingController();
  TextEditingController contenuController = TextEditingController();
  TextEditingController choiceDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Faire une demande",
          // style: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: keyForm,
          child: Column(
            children: [
              DropdownButtonFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  value: first,
                  items: FavorRepository.nameList
                      .map((name) =>
                          DropdownMenuItem(value: name, child: Text(name)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      choiceValue = value!;
                    });
                  }),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: motifController,
                decoration: const InputDecoration(
                  hintText: "Tapez le motif",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Le champ ne peut être vide';
                  }
                  return null;
                },
                onChanged: (value) {
                  motif = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: contenuController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: "Tapez le contenu",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez renseigner ce champ';
                  }
                  return null;
                },
                onChanged: (value) {
                  contenu = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  alignment: Alignment.centerLeft,
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Text(
                      choiceDate != null
                          ? choiceDate.toString()
                          : "Choisir un créneau",
                      style: TextStyle(fontSize: 15)),
                ),
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.parse("1994-02-02"),
                          lastDate: DateTime.parse("2030-02-02"))
                      .then((value) {
                    setState(() {
                      choiceDate = value;
                    });
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (keyForm.currentState!.validate() && choiceDate != null) {
                    Favor fx = Favor(
                        nom: choiceValue,
                        motif: motif,
                        description: contenu,
                        creneau: choiceDate,
                        statut: 0);
                    FavorRepository.favorList.add(fx);
                    setState(() {
                      motifController.clear() ;
                      contenuController.clear();
                      choiceDate = null;
                    });
                    showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                              title: Text("Alerte"),
                              content: Text("Faveur ajoutée avec succès"),
                            ));
                  }
                },
                child: const Text('Valider'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
