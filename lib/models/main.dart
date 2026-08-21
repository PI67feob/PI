import 'dart:io';

import 'class_area.dart';
import 'class_talhao.dart';

void main() {
  var area1 = Area();
  area1.id = 1;
  area1.nome = "Bela vista";

  var talhao1 = Talhao();
  talhao1.nome = "cafe1";
  talhao1.id = 1;
  talhao1.ha = 4.44;
  talhao1.area = area1;

  print("Digitar id do talhao para obter dados");

  String? nome = stdin.readLineSync();
  int? id = int.tryParse(nome ?? "");
  if (id == talhao1.id) {
    print(talhao1.obterArea());
  } else {
    print("talhao nao encontrado");
  }
}
