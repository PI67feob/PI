import 'package:caderno_fazenda/models/aplicador.dart';
import 'package:caderno_fazenda/models/bomba_costal.dart';
import 'package:caderno_fazenda/models/drone.dart';
import 'package:caderno_fazenda/models/trator.dart';
import 'package:test/test.dart';

void main() {
  var trator = Trator(id: 1, capacidadeMaximaL: 600);
  var drone = Drone(
    id: 2,
    modelo: "DJI",
    capacidadeMaximaL: 70,
    capacidadeMaximaKg: 70,
  );
  var costal = BombaCostal(
    id: 3,
    modelo: "Jacto",
    capacidadeMaximaL: 20,
    capacidadeMaximaKg: 20,
  );

  group('polimorfismo', () {
    List<Aplicador> aplicadores = [trator, drone, costal];

    test('descreverCapacidade muda conforme o tipo', () {
      var descricoes = [
        for (var aplicador in aplicadores) aplicador.descreverCapacidade(),
      ];

      expect(descricoes, [
        'Trator 1: tanque de até 600 L',
        'Drone DJI: até 70 L / 70 kg por voo',
        'Bomba costal Jacto: reservatório de até 20 L / 20 kg nas costas do operador',
      ]);
      expect(descricoes.toSet().length, 3);
    });

    test('origemDoRegistro muda conforme o tipo', () {
      var origens = [
        for (var aplicador in aplicadores) aplicador.origemDoRegistro(),
      ];

      expect(origens, ['ficha de papel', 'app do drone', 'ficha de papel']);
    });

    test('tipo vem da subclasse e bate com os valores do banco', () {
      var tipos = [for (var aplicador in aplicadores) aplicador.tipo];

      expect(tipos, ['trator', 'drone', 'bomba costal']);
    });
  });

  group('Aplicador', () {
    test('subclasses sao Aplicador', () {
      expect(trator, isA<Aplicador>());
      expect(drone, isA<Aplicador>());
      expect(costal, isA<Aplicador>());
    });

    test('guarda id, modelo e capacidades maximas', () {
      expect(drone.id, 2);
      expect(drone.modelo, "DJI");
      expect(drone.capacidadeMaximaL, 70);
      expect(drone.capacidadeMaximaKg, 70);
    });

    test('capacidadeMaximaTexto mostra so o que foi informado', () {
      expect(Drone(capacidadeMaximaL: 2.5).capacidadeMaximaTexto, '2.5 L');
      expect(Drone(capacidadeMaximaKg: 10).capacidadeMaximaTexto, '10 kg');
      expect(Trator(id: 9).capacidadeMaximaTexto, 'não informada');
    });

    test('sem modelo, a descricao usa o id', () {
      expect(
        Trator(id: 4, capacidadeMaximaL: 450).descreverCapacidade(),
        'Trator 4: tanque de até 450 L',
      );
    });
  });
}
