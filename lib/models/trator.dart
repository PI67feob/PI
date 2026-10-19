import 'package:caderno_fazenda/models/aplicador.dart';

/// Trator com tanque de calda. Na fazenda é identificado por número e as
/// aplicações são anotadas na ficha de papel.
class Trator extends Aplicador {
  Trator({
    super.id,
    super.modelo,
    super.capacidadeMaximaL,
    super.capacidadeMaximaKg,
  });

  @override
  String get tipo => 'trator';

  @override
  String descreverCapacidade() =>
      'Trator ${modelo ?? id}: tanque de até $capacidadeMaximaTexto';

  @override
  String origemDoRegistro() => 'ficha de papel';
}
