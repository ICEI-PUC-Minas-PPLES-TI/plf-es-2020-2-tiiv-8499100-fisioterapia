import 'package:FisioApp/contaFisioterapeuta/model/teste.dart';

class Exame {
  final int id;
  List<Teste> testes;
  final String nomeAuxiliar;
  final String nomeAtleta;
  String cpf = 'Pendente';
  bool pendente = false;

  Exame(
    this.id,
    this.nomeAuxiliar,
    this.nomeAtleta,
    this.testes,
  );

  set inserirCpf(String cpf) {
    this.cpf = cpf;
  }

  set atualizarStatus(bool status) {
    this.pendente = status;
  }
}
