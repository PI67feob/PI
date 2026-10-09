import 'package:caderno_fazenda/models/insumo.dart';
import 'package:test/test.dart';

void main() {
  test('Insumo guarda nome, id, marca e tipo', () {
    var insumo = Insumo(
      nome: "Orkestra SC",
      id: 13,
      marca: "BASF",
      tipo: "Fungicida",
    );

    expect(insumo.nome, "Orkestra SC");
    expect(insumo.id, 13);
    expect(insumo.marca, "BASF");
    expect(insumo.tipo, "Fungicida");
  });
}
