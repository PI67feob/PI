/// Excecao base para erros das funcoes de calculo.
class CaldaException implements Exception {
  final String message;

  CaldaException(this.message);

  @override
  String toString() => 'CaldaException: $message';
}

/// Excecao para unidades nao reconhecidas.
class UnidadeDesconhecidaException extends CaldaException {
  UnidadeDesconhecidaException(String unidade)
      : super('Unidade desconhecida: $unidade');
}

/// Excecao usada quando uma conversao massa <-> volume exige densidade.
class DensidadeNecessariaException extends CaldaException {
  DensidadeNecessariaException()
      : super(
          'Nao e possivel converter entre massa e volume sem informar a densidade.',
        );
}

/// Funcao 1 - calcula o volume total de calda.
///
/// Entrada:
/// - [areaHa]: area da aplicacao, em hectares.
/// - [taxaLitrosPorHa]: taxa de aplicacao, em litros por hectare.
///
/// Saida:
/// - Retorna o volume total de calda, em litros.
///
/// Erros:
/// - Lanca [CaldaException] se [areaHa] for negativa.
/// - Lanca [CaldaException] se [taxaLitrosPorHa] for menor ou igual a zero.
double volumeCalda(double areaHa, double taxaLitrosPorHa) {
  if (areaHa < 0) {
    throw CaldaException('A area nao pode ser negativa.');
  }

  if (taxaLitrosPorHa <= 0) {
    throw CaldaException('A taxa de aplicacao deve ser maior que zero.');
  }

  return areaHa * taxaLitrosPorHa;
}

/// Funcao 2 - calcula a quantidade de produto com dose por hectare.
///
/// Entrada:
/// - [areaHa]: area da aplicacao, em hectares.
/// - [dosePorHa]: dose do produto por hectare.
///
/// Saida:
/// - Retorna a quantidade total de produto na mesma unidade da dose.
///
/// Erros:
/// - Lanca [CaldaException] se [areaHa] ou [dosePorHa] forem negativas.
double quantidadeProdutoPorHa(double areaHa, double dosePorHa) {
  if (areaHa < 0) {
    throw CaldaException('A area nao pode ser negativa.');
  }

  if (dosePorHa < 0) {
    throw CaldaException('A dose nao pode ser negativa.');
  }

  return areaHa * dosePorHa;
}

/// Funcao 3 - calcula a quantidade de produto com dose por 1000 L de calda.
///
/// Entrada:
/// - [volumeLitros]: volume total de calda, em litros.
/// - [dosePor1000Litros]: dose do produto para cada 1000 L de calda.
///
/// Saida:
/// - Retorna a quantidade total de produto na mesma unidade da dose.
///
/// Observacao:
/// - 1000 L nao recebe tratamento especial; a mesma formula vale para
///   qualquer volume nao negativo.
///
/// Erros:
/// - Lanca [CaldaException] se [volumeLitros] ou [dosePor1000Litros] forem
///   negativos.
double quantidadeProdutoPor1000L(
  double volumeLitros,
  double dosePor1000Litros,
) {
  if (volumeLitros < 0) {
    throw CaldaException('O volume de calda nao pode ser negativo.');
  }

  if (dosePor1000Litros < 0) {
    throw CaldaException('A dose nao pode ser negativa.');
  }

  return (volumeLitros / 1000) * dosePor1000Litros;
}

/// Funcao 4 - normaliza uma dose para L/ha.
///
/// Entrada:
/// - [dose]: valor numerico da dose.
/// - [unidadeDose]: deve ser "L/ha" ou "L/1000L".
/// - [taxaLitrosPorHa]: taxa de aplicacao em L/ha.
///
/// Saida:
/// - Retorna a dose normalizada em L/ha.
///
/// Regras:
/// - "L/ha" e retornado sem conversao.
/// - "L/1000L" e convertido usando [taxaLitrosPorHa].
///
/// Erros:
/// - Lanca [CaldaException] para dose negativa ou taxa menor/igual a zero.
/// - Lanca [UnidadeDesconhecidaException] para unidade nao reconhecida.
double normalizarDose(
  double dose,
  String unidadeDose,
  double taxaLitrosPorHa,
) {
  if (dose < 0) {
    throw CaldaException('A dose nao pode ser negativa.');
  }

  if (taxaLitrosPorHa <= 0) {
    throw CaldaException('A taxa de aplicacao deve ser maior que zero.');
  }

  switch (unidadeDose.toLowerCase().trim()) {
    case 'l/ha':
      return dose;
    case 'l/1000l':
      return dose * (taxaLitrosPorHa / 1000);
    default:
      throw UnidadeDesconhecidaException(unidadeDose);
  }
}

/// Funcao 5 - converte unidades de volume e massa.
///
/// Entrada:
/// - [valor]: valor a converter, nao negativo.
/// - [unidadeOrigem]: "ml", "l", "g", "kg" ou "ton".
/// - [unidadeDestino]: "ml", "l", "g", "kg" ou "ton".
///
/// Saida:
/// - Retorna o valor convertido para [unidadeDestino].
///
/// Conversoes suportadas:
/// - mL <-> L.
/// - g <-> kg <-> ton.
///
/// Observacao:
/// - Conversoes entre massa e volume nao sao realizadas porque exigem
///   densidade do produto.
///
/// Erros:
/// - Lanca [CaldaException] para valor negativo.
/// - Lanca [UnidadeDesconhecidaException] para unidade invalida.
/// - Lanca [DensidadeNecessariaException] em conversoes massa <-> volume.
double converterUnidade(
  double valor,
  String unidadeOrigem,
  String unidadeDestino,
) {
  if (valor < 0) {
    throw CaldaException('O valor nao pode ser negativo.');
  }

  final origem = unidadeOrigem.toLowerCase().trim();
  final destino = unidadeDestino.toLowerCase().trim();

  const unidadesVolume = {'ml', 'l'};
  const unidadesMassa = {'g', 'kg', 'ton'};

  final origemValida =
      unidadesVolume.contains(origem) || unidadesMassa.contains(origem);
  final destinoValido =
      unidadesVolume.contains(destino) || unidadesMassa.contains(destino);

  if (!origemValida) {
    throw UnidadeDesconhecidaException(unidadeOrigem);
  }

  if (!destinoValido) {
    throw UnidadeDesconhecidaException(unidadeDestino);
  }

  final origemEhMassa = unidadesMassa.contains(origem);
  final destinoEhVolume = unidadesVolume.contains(destino);
  final origemEhVolume = unidadesVolume.contains(origem);
  final destinoEhMassa = unidadesMassa.contains(destino);

  if ((origemEhMassa && destinoEhVolume) ||
      (origemEhVolume && destinoEhMassa)) {
    throw DensidadeNecessariaException();
  }

  if (origem == destino) {
    return valor;
  }

  final valorBase = switch (origem) {
    'ml' => valor / 1000,
    'l' => valor,
    'g' => valor,
    'kg' => valor * 1000,
    'ton' => valor * 1000000,
    _ => throw UnidadeDesconhecidaException(unidadeOrigem),
  };

  return switch (destino) {
    'ml' => valorBase * 1000,
    'l' => valorBase,
    'g' => valorBase,
    'kg' => valorBase / 1000,
    'ton' => valorBase / 1000000,
    _ => throw UnidadeDesconhecidaException(unidadeDestino),
  };
}
