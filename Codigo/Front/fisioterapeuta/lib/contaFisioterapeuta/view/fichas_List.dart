import 'package:FisioApp/contaFisioterapeuta/model/exame.dart';
import 'package:FisioApp/contaFisioterapeuta/view/widget/exame-view.dart';
import 'package:flutter/material.dart';

class Fichas extends StatelessWidget {
  final List<Exame> lista;
  Fichas(this.lista);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: lista.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text('Lista vazia'),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          : ListView.builder(
              itemCount: lista.length,
              itemBuilder: (ctx, index) {
                final exa = lista[index];
                return ExameView(exa);
              },
            ),
    );
  }
}
