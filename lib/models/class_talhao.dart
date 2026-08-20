import 'class_area.dart';

class Talhao {
  String? nome;
  int? id;
  double? ha;
  Area? area;

  String obterArea() {
    return "$nome - $id - $ha - ${area?.nome}";
  }
}
