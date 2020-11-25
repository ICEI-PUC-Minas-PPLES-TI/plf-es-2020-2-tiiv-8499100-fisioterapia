import 'package:flutter/material.dart';
import 'package:projeto_fisio/provider/auxFichas.dart';
import 'package:projeto_fisio/utils/app_routes.dart';
import 'package:provider/provider.dart';

class Dirsoflexao extends StatefulWidget {
  final int idExame;
  final int idTeste;

  Dirsoflexao(this.idExame, this.idTeste);
  @override
  _Dirsoflexao createState() => _Dirsoflexao();
}

class _Dirsoflexao extends State<Dirsoflexao> {
  String infoText = "Força de pontência muscular";
  TextEditingController membroDireito = TextEditingController();
  var verificarTeste = true;
  TestePendente teste;

  Widget buildTextfield(String label, TextEditingController controll) {
    return TextField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
          border: OutlineInputBorder()),
      style: TextStyle(color: Colors.black, fontSize: 16.0),
      keyboardType: TextInputType.number,
      controller: controll,
    );
  }

  void _resetField() {
    setState(() {
      membroDireito.text = "";
      infoText = "Força de pontência muscular";
    });
  }

  void _calculate() {
    int mDireito = int.parse(membroDireito.text);
    //int mEsquerdo = int.parse(membroEsquerdo.text);
    FichasAux fichasAux = Provider.of<FichasAux>(context, listen: false);

    setState(() {
      if (mDireito >= 33.6 && mDireito <= 44) {
        infoText = "Valor entre 33.6° - 44°";
      } else
        infoText = "Valor fora de 33.6° - 44°";

      teste = fichasAux.inserirRespostaTesteDoisValores(
        widget.idExame,
        widget.idTeste,
        membroDireito.text,
        'Não preenchido',
        infoText,
        'Não preenchido',
      );
      verificarTeste = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        title: Text(" Dorsiflexão Test"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _resetField();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            buildTextfield("Força de pontência muscular:", membroDireito),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: Text(
                infoText,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 40.0,
                    child: verificarTeste
                        ? RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.teal[700],
                            child: Text(
                              "Verificar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            onPressed: () {
                              setState(() {
                                _calculate();
                              });
                            },
                          )
                        : RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.teal[700],
                            child: Text(
                              "Enviar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            onPressed: () {
                              setState(() {
                                Provider.of<FichasAux>(context, listen: false)
                                    .enviarExerciciosRespondidos(teste)
                                    .then((_) {
                                  Navigator.of(context).pop();
                                });
                              });
                            },
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
