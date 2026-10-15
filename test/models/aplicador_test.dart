import 'package:caderno_fazenda/models/aplicador.dart';
import 'package:test/test.dart';

void main() {
  test('Aplicador guarda id, modelo, capacidades maximas e tipo', () {
    var aplicador = Aplicador(
      id: 1,
      modelo: "DJI",
      capacidadeMaximaL: 70,
      capacidadeMaximaKg: 70,
      tipo: "drone",
    );

    expect(aplicador.id, 1);
    expect(aplicador.modelo, "DJI");
    expect(aplicador.capacidadeMaximaL, 70);
    expect(aplicador.capacidadeMaximaKg, 70);
    expect(aplicador.tipo, "drone");
  });
}
