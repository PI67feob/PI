/// Equipamento usado para aplicar calda nos talhões.
///
/// A fazenda tem três tipos de aplicador: `Trator`, `Drone` e `BombaCostal`.
/// Cada subclasse define o próprio [tipo] (igual ao valor gravado no banco) e
/// implementa [descreverCapacidade] e [origemDoRegistro] do seu jeito.
///
/// A capacidade é um limite máximo, não um volume fixo: o tanque nem sempre é
/// cheio. A regra "volume acima da capacidade" fica na frente de Lógica; aqui
/// o aplicador só expõe a sua capacidade máxima.
abstract class Aplicador {
  int? id;
  String? modelo;
  double? capacidadeMaximaL;
  double? capacidadeMaximaKg;

  Aplicador({
    this.id,
    this.modelo,
    this.capacidadeMaximaL,
    this.capacidadeMaximaKg,
  });

  /// Tipo do aplicador, com o mesmo texto usado no banco:
  /// `trator`, `drone` ou `bomba costal`.
  String get tipo;

  /// Descreve a capacidade máxima do aplicador do jeito do seu tipo.
  String descreverCapacidade();

  /// Onde a fazenda registra as aplicações feitas com este tipo de aplicador.
  String origemDoRegistro();

  /// Capacidade máxima em texto, ex.: `70 L / 70 kg`.
  /// Mostra `não informada` quando nenhuma capacidade foi cadastrada.
  String get capacidadeMaximaTexto {
    var partes = [
      if (capacidadeMaximaL != null) '${_numero(capacidadeMaximaL!)} L',
      if (capacidadeMaximaKg != null) '${_numero(capacidadeMaximaKg!)} kg',
    ];
    return partes.isEmpty ? 'não informada' : partes.join(' / ');
  }

  /// Mostra `70` em vez de `70.0` quando o valor não tem casas decimais.
  static String _numero(double valor) => valor == valor.truncateToDouble()
      ? valor.toInt().toString()
      : valor.toString();
}
