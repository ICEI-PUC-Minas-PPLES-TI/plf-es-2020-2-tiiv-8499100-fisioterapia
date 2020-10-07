import 'package:flutter/material.dart';
import '../../model/teste.dart';

class TesteView extends StatelessWidget {
  final Teste testes;
  TesteView(this.testes);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      padding: EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.teal[700],
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'ID : ${testes.idTeste}',
            style: TextStyle(
              color: Colors.teal[600],
            ),
          ),
          Text(
            'Nome : ${testes.nome}',
            style: TextStyle(
              color: Colors.teal[600],
            ),
          ),
          Text(
            'Resultado : ${testes.resultado}',
            style: TextStyle(
              color: Colors.teal[600],
            ),
          ),
        ],
      ),
    );
  }
}
