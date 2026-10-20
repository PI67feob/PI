import 'package:caderno_fazenda/models/operacao.dart';
import 'package:test/test.dart';

void main() {
  test('Operacao guarda id e descricao', () {
    var operacao = Operacao(id: 1, descricao: "Pulverizacao");

    expect(operacao.id, 1);
    expect(operacao.descricao, "Pulverizacao");
  });
}
