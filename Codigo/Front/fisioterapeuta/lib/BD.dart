import 'contaFisioterapeuta/model/teste.dart';
import 'contaFisioterapeuta/model/exame.dart';

final List<Exame> exames = [
  Exame(1, 'Auxiliar', 'Atleta', [
    Teste(2, 'Teste membro superior', 'resultado'),
    Teste(3, 'nome', 'resultado'),
    Teste(4, 'nome', 'resultado'),
    Teste(1, 'nome', 'resultado'),
    Teste(1, 'nome', 'resultado')
  ]),
  Exame(1, 'Auxiliar', 'Atleta', [
    Teste(1, 'nome', 'resultado'),
    Teste(1, 'nome', 'resultado'),
    Teste(1, 'nome', 'resultado'),
    Teste(1, 'nome', 'resultado'),
    Teste(1, 'nome', 'resultado')
  ]),
  Exame(1, 'Auxiliar', 'Atleta', [
    Teste(1, 'nome', 'resultado'),
    Teste(1, 'nome', 'resultado'),
    Teste(1, 'nome', 'resultado'),
    Teste(1, 'nome', 'resultado'),
    Teste(1, 'nome', 'resultado')
  ]),
  Exame(1, 'Auxiliar', 'Atleta', [
    Teste(1, 'nome', 'resultado'),
    Teste(1, 'nome', 'resultado'),
    Teste(1, 'nome', 'resultado'),
    Teste(1, 'nome', 'resultado'),
    Teste(1, 'nome', 'resultado')
  ]),
];

void atualizar() {
  exames.forEach((e) {
    e.pendente = true;
  });
}

void inserirFicha(
    String nomeAuxiliar, String nomeAtleta, List<Teste> testeSelecionado) {
  Exame novo =
      new Exame(exames.length, nomeAuxiliar, nomeAtleta, testeSelecionado);
  exames.add(novo);
}
