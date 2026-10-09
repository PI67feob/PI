import 'package:caderno_fazenda/models/area.dart';
import 'package:caderno_fazenda/models/talhao.dart';
import 'package:test/test.dart';

void main() {
  var sede = Area(nome: "Sede", id: 1);

  test('Talhao guarda nome, id, hectares e area', () {
    var talhao = Talhao(nome: "Chico1", id: 1, hectares: 2.80, area: sede);

    expect(talhao.nome, "Chico1");
    expect(talhao.id, 1);
    expect(talhao.hectares, 2.80);
    expect(talhao.area, same(sede));
  });

  test('obterDados devolve os dados do talhao', () {
    var talhao = Talhao(nome: "Chico1", id: 1, hectares: 2.80, area: sede);

    expect(
      talhao.obterDados(),
      "nome:Chico1 - id:1 - hectares:2.8 - area:Sede",
    );
  });
}
