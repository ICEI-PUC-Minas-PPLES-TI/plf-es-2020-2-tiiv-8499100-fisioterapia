import 'dart:convert';

import 'package:FisioApp/providers/atleta.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Atletas with ChangeNotifier {
  final String baseUrl = 'https://flutter-testereq.firebaseio.com/atletas';

  List<Atleta> listaAtl = [];

  String _token;
  String _userId;
  Atletas(this._token, this._userId, this.listaAtl);

  Future<void> addAtleta(String nomeInserido, String cpfInserido) async {
    final response = await http.post(
      '$baseUrl/$_userId.json?auth=$_token',
      body: json.encode({
        'nome': nomeInserido,
        'cpf': cpfInserido,
      }),
    );
    listaAtl.add(
      new Atleta(
        idServer: json.decode(response.body)['name'],
        nome: nomeInserido,
        celular: cpfInserido,
      ),
    );
    notifyListeners();
  }

  Future<void> loadAtletas() async {
    //final response = await http.get('$baseUrl/$_userId.json?auth=$_token');
    //Map<String, dynamic> data = json.decode(response.body);
    listaAtl.clear();
    final response = await http
        .get('https://fisioterapiaapp.azurewebsites.net/Atleta/getallatleta');
    List<dynamic> data = json.decode(response.body);
    print('lista de atletas : ');
    // print(data);

    if (data != null) {
      // corrigir depois
      data.forEach((dataBody) {
        listaAtl.add(Atleta(
          idServer: dataBody['id'].toString(),
          nome: dataBody['nome'],
          celular: dataBody['celular'],
        ));
      });

      notifyListeners();
    } else {
      print('lista vazia');
    }
    return Future.value();
  }

  List<Atleta> retornaAtletasSelecionados() {
    List<Atleta> atletasSelecionados = [];

    listaAtl.forEach(
      (element) {
        if (element.selecionado) {
          print('atleta selecionado : ${element.nome}');
          atletasSelecionados.add(element);
          element.selecionado = !element.selecionado;
        }
      },
    );
    return atletasSelecionados;
  }
}
