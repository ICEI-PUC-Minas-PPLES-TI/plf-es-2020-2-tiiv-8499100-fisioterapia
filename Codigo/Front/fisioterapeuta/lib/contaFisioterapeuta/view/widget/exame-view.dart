import 'package:FisioApp/contaFisioterapeuta/model/exame.dart';
import 'package:FisioApp/contaFisioterapeuta/view/widget/teste-view.dart';
import 'package:flutter/material.dart';

class ExameView extends StatelessWidget {
  final Exame exa;
  ExameView(this.exa);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.teal[700],
                  width: 4,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        ' ID : ${exa.id.toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.teal[700],
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(exa.pendente ? 'Concluido' : 'Pendente'),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Icon(exa.pendente
                                  ? Icons.check
                                  : Icons.access_time),
                            ),
                          ],
                        ),
                        //child: Text(exa.pendente ? "Concluído" : 'Pendente')
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' Nome do auxiliar: ${exa.nomeAuxiliar}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.teal[700],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' Nome do atleta: ${exa.nomeAtleta}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.teal[700],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 300,
              child: ListView.builder(
                itemCount: exa.testes.length,
                itemBuilder: (ctx, index) {
                  final teste = exa.testes[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TesteView(teste),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
