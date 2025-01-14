import 'package:aplicacio_tasques2425/components/dialog_nova_tasca.dart';
import 'package:aplicacio_tasques2425/components/item_tasca.dart';
import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  List tasquesLlista = [
    {"titol": "tasca1", "valor": false},
    {"titol": "tasca2", "valor": true},
    {"titol": "tasca3", "valor": false},
    {"titol": "tasca69", "valor": false},
  ];
  void canviaCheckbox(int posLlista) {
    setState(() {
      //     if (valorCheckbox) {
      //           tasquesLlista[posLlista]["valor"] = false;
      // } else {
      //       tasquesLlista[posLlista]["valor"] = true;
      // }
      tasquesLlista[posLlista]["valor"] = !tasquesLlista[posLlista]["valor"];
    });
  }

  void crearNovaTasca() {
    showDialog(
      context: context,
      builder: (context) {
        return  const DialogNovaTasca();
      },
    );
  }

  void accioEsborrarTasca(int posLlista) {
    setState(() {
      tasquesLlista.removeAt(posLlista);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[400],

      // AppBar.
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("App Tasques"),
        foregroundColor: Colors.orange[400],
      ),

      // FloatingActionButton.
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        onPressed: crearNovaTasca,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      // Body.
      body: ListView.builder(
          itemCount: tasquesLlista.length,
          itemBuilder: (context, index) {
            return ItemTasca(
              textTasca: tasquesLlista[index]["titol"],
              valorRebut: tasquesLlista[index]["valor"],
              canviaValorCheckbox: (valor) => canviaCheckbox(index),
              esborrarTasca: (valor) => accioEsborrarTasca(index),
            );
          }),
    );
  }
}
