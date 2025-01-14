import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTasca extends StatelessWidget {
  final String textTasca;
  final bool valorRebut;
  final Function(bool?)? canviaValorCheckbox;
  final Function(BuildContext)? esborrarTasca;

  const ItemTasca(
      {super.key,
      required this.textTasca,
      required this.valorRebut,
      required this.canviaValorCheckbox,
      required this.esborrarTasca
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 16),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
              onPressed: esborrarTasca
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                activeColor: Colors.black,
                checkColor: Colors.orange[200],
                side: BorderSide(color: Colors.orange[200]!, width: 2),
                value: valorRebut,
                onChanged: canviaValorCheckbox,
              ),
              //text
              Text(
                textTasca,
                style: TextStyle(
                    color: Colors.yellow[200],
                    decoration: valorRebut
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.orange[200],
                    decorationThickness: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
