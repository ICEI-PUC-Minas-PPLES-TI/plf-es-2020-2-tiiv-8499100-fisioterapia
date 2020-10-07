import 'package:FisioApp/contaFisioterapeuta/model/teste.dart';
import 'package:flutter/material.dart';

class FichasForm extends StatefulWidget {
  final void Function(String, String, List<Teste>) _inserirFicha;
  FichasForm(this._inserirFicha);

  @override
  _FichasFormState createState() => _FichasFormState();
}

class _FichasFormState extends State<FichasForm> {
  final nomeAuxiliarController = TextEditingController();
  final nomeAtletaController = TextEditingController();

  _inserirFicha() {
    final nomeAuxiliar = nomeAuxiliarController.text;
    final nomeAtleta = nomeAtletaController.text;
  }

  //final cpfAtletaController = TextEditingController();
  //final List<Teste> testesController =TextEditingValue.fromJSON(encoded)

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nomeAuxiliarController,
              onSubmitted: (_) => _inserirFicha(),
              decoration: InputDecoration(
                labelText: 'Auxiliar',
              ),
            ),
            TextField(
              controller: nomeAtletaController,
              onSubmitted: (_) => _inserirFicha(),
              decoration: InputDecoration(
                labelText: 'Atleta',
              ),
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Text('Cadastrar Exame'),
                  textColor: Colors.teal,
                  onPressed: _inserirFicha,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
