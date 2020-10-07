import 'package:flutter/material.dart';

class AuxiliaresForm extends StatefulWidget {
  final void Function(String, String) submterFormulario;
  AuxiliaresForm(this.submterFormulario);
  @override
  _AuxiliaresFormState createState() => _AuxiliaresFormState();
}

class _AuxiliaresFormState extends State<AuxiliaresForm> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();

  _submitForm() {
    final nome = nomeController.text;
    final email = emailController.text;
    widget.submterFormulario(nome, email);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nomeController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            TextField(
              controller: emailController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Text('Cadastrar Auxiliar'),
                  textColor: Colors.teal,
                  onPressed: _submitForm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
