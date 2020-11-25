import 'dart:convert';

import 'package:FisioApp/providers/auxiliar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auxiliares with ChangeNotifier {
  Auxiliar selecionado;
  String chaveSelecionada;

  List<Auxiliar> listaAux = [];
  String _token;
  String _userId;
  Auxiliares(this._token, this._userId, this.listaAux);

  Future<void> loadAuxiliares() async {
    final response = await http
        .get('https://fisioterapiaapp1.azurewebsites.net/Usuario/$_userId');
    List<dynamic> data = json.decode(response.body);

    listaAux.clear();

    if (data != null) {
      data.forEach((dataBody) {
        listaAux.add(
          Auxiliar(
            idServer: dataBody['id'].toString(),
            nome: dataBody['nome'],
            email: dataBody['email'],
          ),
        );
      });
      notifyListeners();
    }

    return Future.value();
  }

  void atualizarSelecionado() {
    selecionado =
        listaAux.singleWhere((element) => element.idServer == chaveSelecionada);
  }
}
