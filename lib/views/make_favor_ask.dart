import 'package:flutter/material.dart';
import 'package:make_favor/repository/favor_repository.dart';


class make_favor_ask extends StatefulWidget {
  const make_favor_ask({super.key});

  @override
  State<make_favor_ask> createState() => _make_favor_askState();
}

class _make_favor_askState extends State<make_favor_ask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.brown),
          width: MediaQuery.of(context).size.width / 2,
          height: 50,
          alignment: Alignment.center,
          child: const Text(
            "Listes de demande",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 18),
        Expanded(
          child: ListView(
              children: FavorRepository.favorList
                  .where((favor) => favor.statut == 0)
                  .map((favor) => Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(favor.motif.toString()),
                              subtitle: Text(favor.description.toString()),
                              leading: const CircleAvatar(
                                  child: Image(
                                image: AssetImage("assets/logo.png"),
                              )),
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        FavorRepository.acceptFavor(favor);
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        foregroundColor: Colors.white),
                                    child: const Text("Accepter")),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        FavorRepository.refuseFavor(favor);
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white),
                                    child: const Text("Refuser"))
                              ],
                            )
                          ],
                        ),
                      ))
                  .toList()),
          // child: ListView.builder(
          //     itemBuilder: ((context, index) {
          //       Favor favor = FavorRepository.favorList[index];
          //       return Card(
          //         child: Column(
          //           children: [
          //             ListTile(
          //               title: Text(fx.motif.toString()),
          //               subtitle: Text(fx.description.toString()),
          //               leading: CircleAvatar(
          //                   child: Image(
          //                 image: AssetImage("assets/logo.png"),
          //               )),
          //             ),
          //             Divider(

          //             ),
          //             Row(children: [
          //               ElevatedButton(onPressed: (){
          //                 FavorRepository.acceptFavor(fx);
          //               },
          //               style: ElevatedButton.styleFrom(
          //                 backgroundColor: Colors.green,
          //                 foregroundColor: Colors.white

          //               ),
          //               child: Text("Accepter")),
          //               SizedBox(width: 10,),
          //               ElevatedButton(onPressed: (){
          //                 FavorRepository.refuseFavor(fx);
          //               },
          //               style: ElevatedButton.styleFrom(
          //                 backgroundColor: Colors.red,
          //                 foregroundColor: Colors.white
          //               ),
          //               child: Text("Refuser"))
          //             ],
          //             mainAxisAlignment: MainAxisAlignment.end,
          //             )
          //           ],
          //         ),
          //       );
          //     }),
          //     itemCount: FavorRepository.favorList.length),
        )
      ]),
    );
  }
}
