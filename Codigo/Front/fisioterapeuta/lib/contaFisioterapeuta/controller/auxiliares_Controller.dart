import 'package:FisioApp/contaFisioterapeuta/controller/auxiliares_Form.dart';
import 'package:FisioApp/contaFisioterapeuta/view/auxiliares_List.dart';
import 'package:flutter/material.dart';
import 'package:FisioApp/contaFisioterapeuta/model/typeAuxiliares.dart';

class AuxiliaresController extends StatefulWidget {
  AuxiliaresController();
  @override
  _AuxiliaresControllerState createState() => _AuxiliaresControllerState();
}

class _AuxiliaresControllerState extends State<AuxiliaresController> {
  var _idEstado = 3;
  final List<Auxiliar> _auxiliares = [
    Auxiliar(
      id: 1,
      nome: 'Isadora',
      email: 'isadora33@gmail.com',
    ),
    Auxiliar(
      id: 2,
      nome: 'José',
      email: 'jose93@gmail.com',
    ),
    Auxiliar(
      id: 3,
      nome: 'Roberto',
      email: 'roberto92@gmail.com',
    ),
  ];

  void _inserirAuxiliar(String nomeInput, String emailInput) {
    _idEstado++;
    final novoAuxiliar = Auxiliar(
      id: _idEstado,
      nome: nomeInput,
      email: emailInput,
    );

    setState(() {
      _auxiliares.add(novoAuxiliar);
    });

    Navigator.of(context).pop();
  }

  void _abrirFormularioAuxiliar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AuxiliaresForm(_inserirAuxiliar);
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
          'Auxiliares',
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
            Auxiliares(_auxiliares),
            FlatButton(
              child: Icon(
                Icons.add_circle,
                color: Colors.tealAccent[700],
                size: 90.0,
              ),
              onPressed: () => _abrirFormularioAuxiliar(context),
            ),
          ],
        ),
      ),
    );
  }
}
