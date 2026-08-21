import 'class_area.dart';

class Talhao {
  String? nome;
  int? id;
  double? ha;
  Area? area;

  String obterArea() {
    return " nome:$nome - id:$id - hectares:$ha - area:${area?.nome}";
  }
}
