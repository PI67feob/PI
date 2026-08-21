import 'class_area.dart';
import 'class_talhao.dart';

main() {
  var area1 = new Area();
  area1.id = 1;
  area1.nome = "Bela vista";

  var talhao1 = new Talhao();
  talhao1.nome = "cafe1";
  talhao1.id = 1;
  talhao1.ha = 4.44;
  talhao1.area = area1;

  print(talhao1.obterArea());
}
