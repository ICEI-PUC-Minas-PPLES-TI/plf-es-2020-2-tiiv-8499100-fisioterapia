import 'package:FisioApp/contaFisioterapeuta/controller/fichas_Form.dart';
import 'package:FisioApp/contaFisioterapeuta/model/teste.dart';
import 'package:FisioApp/contaFisioterapeuta/view/fichas_List.dart';
import 'package:flutter/material.dart';

import 'package:FisioApp/BD.dart';

class FichasController extends StatefulWidget {
  @override
  _FichasControllerState createState() => _FichasControllerState();
}

class _FichasControllerState extends State<FichasController> {
  void _receberFicha(
      String nomeAuxiliar, String nomeAtleta, List<Teste> testesEscolhidos) {
    inserirFicha(nomeAuxiliar, nomeAtleta, testesEscolhidos);
  }

  void _abrirFormularioFicha(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return FichasForm(_receberFicha);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        backgroundColor: Colors.teal[600],
        titleSpacing: 60,
        title: Text(
          'Fichas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        color: Colors.teal[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Fichas(exames),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Atualizar Fichas',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.teal[700],
                    onPressed: () {
                      setState(() {
                        atualizar();
                      });
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'Novo Exame',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.teal[700],
                    onPressed: () {
                      setState(() {
                        atualizar();
                      });
                    },
                  ),
                ],
              ),
            ),
            /* Container(
              alignment: Alignment.center,
              child: FlatButton(
                child: Icon(
                  Icons.update,
                  color: Colors.tealAccent[700],
                  size: 50.0,
                ),
                onPressed: () {
                  setState(() {
                    atualizar();
                  });
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
