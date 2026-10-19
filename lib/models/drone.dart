import 'package:caderno_fazenda/models/aplicador.dart';

/// Drone de pulverização. As aplicações ficam registradas no app do drone
/// (produto, dose, data e mapa de voo).
class Drone extends Aplicador {
  Drone({
    super.id,
    super.modelo,
    super.capacidadeMaximaL,
    super.capacidadeMaximaKg,
  });

  @override
  String get tipo => 'drone';

  @override
  String descreverCapacidade() =>
      'Drone ${modelo ?? id}: até $capacidadeMaximaTexto por voo';

  @override
  String origemDoRegistro() => 'app do drone';
}
