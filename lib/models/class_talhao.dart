import 'class_area.dart';

class Talhao {
  String? nome;
  int? id;
  double? ha;
  Area? area;

Talhao({
  this.nome,
  this.id,
  this.ha,
  this.area
});



  // renomeado: o metodo devolve os dados do talhao, nao a area
  String obterDados() {
    return "nome:$nome - id:$id - hectares:$ha - area:${area?.nome}";
  }
}
