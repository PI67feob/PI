import 'class_talhao.dart';
import 'class_area.dart';
import 'class_aplicador.dart';
import 'class_operacao.dart';
import 'class_insumo.dart';

import 'dart:io';

import 'dados_teste.dart';

void main() {
  var areaSede = sede();

  var t1 = chico1(areaSede);
  var t2 = cafeVelho(areaSede);

  print(t1.obterDados());
  print(t2.obterDados());
}
