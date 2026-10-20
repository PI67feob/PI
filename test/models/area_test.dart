import 'package:caderno_fazenda/models/area.dart';
import 'package:test/test.dart';

void main() {
  test('Area guarda nome e id', () {
    var area = Area(nome: "Sede", id: 1);

    expect(area.nome, "Sede");
    expect(area.id, 1);
  });
}
