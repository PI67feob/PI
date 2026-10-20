import 'package:caderno_fazenda/models/area.dart';
import 'package:caderno_fazenda/models/insumo.dart';
import 'package:caderno_fazenda/models/talhao.dart';

void main() {
  var sede = Area(nome: "Sede", id: 1);

  var chico1 = Talhao(nome: "Chico1", id: 1, hectares: 2.80, area: sede);
  var cafeVelho = Talhao(nome: "Cafe Velho", id: 5, hectares: 6.40, area: sede);

  var orkestra = Insumo(
    nome: "Orkestra SC",
    id: 13,
    marca: "BASF",
    tipo: "Fungicida",
  );

  print(chico1.obterDados());
  print(cafeVelho.obterDados());
  print(
    "insumo: ${orkestra.nome} - marca: ${orkestra.marca} - tipo: ${orkestra.tipo}",
  );
}
