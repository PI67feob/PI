// importa a biblioteca de entrada/saida (stdin e stdout)
import 'dart:io';

// importa as classes que vamos usar aqui
import 'class_area.dart';
import 'class_talhao.dart';

void main() {
  // cria uma area e preenche os campos
  var area1 = Area();
  area1.id = 1;
  area1.nome = "Bela vista";

  // cria um talhao e liga ele na area1
  var talhao1 = Talhao();
  talhao1.nome = "cafe1";
  talhao1.id = 1;
  talhao1.ha = 4.44;
  talhao1.area = area1;

  // mensagem para o usuario
  print("Digitar id do talhao para obter dados");

  // le o que o usuario digitou. pode vir null se o terminal fechar
  String? entrada = stdin.readLineSync();

  // tenta converter o texto em numero.
  // tryParse devolve null se nao for numero (ex: o usuario digitou "abc")
  int? id = int.tryParse(entrada ?? "");

  // se id for null, a entrada nao era um numero valido
  if (id == null) {
    print("Entrada invalida, digite um numero.");
  } else if (id == talhao1.id) {
    // achou o talhao, imprime os dados
    print(talhao1.obterDados());
  } else {
    // digitou um numero, mas nao existe talhao com esse id
    print("talhao nao encontrado");
  }
}

//por enquanto testes
