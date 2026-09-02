//arquivo teste, ignora ele diogo.
import 'class_talhao.dart';
import 'class_area.dart';
import 'class_aplicador.dart';
import 'class_operacao.dart';
import 'class_insumo.dart';

//====================================AREAS===================================================

Area sede() {
  return Area(nome: "Sede", id: 1);
}

//==================TALHOES=====================================================================

Talhao chico1(Area s) {
  return Talhao(nome: "Chico1", id: 1, hectares: 2.80, area: s);
}

Talhao chico2(Area s) {
  return Talhao(nome: "Chico2", id: 2, hectares: 3.80, area: s);
}

Talhao pinheiro(Area s) {
  return Talhao(nome: "Pinheiro", id: 3, hectares: 2.05, area: s);
}

Talhao engenho(Area s) {
  return Talhao(nome: "Engenho", id: 4, hectares: 4.90, area: s);
}

Talhao cafeVelho(Area s) {
  return Talhao(nome: "Cafe Velho", id: 5, hectares: 6.40, area: s);
}

//area s nome da funcao, sempre atribuir o objeto a ela
//=================================APLICADOR====================
Aplicador drone() {
  return Aplicador(
    id: 1,
    modelo: "DJI",
    capacidadeL: 70,
    capacidadeKG: 70,
    tipo: "drone",
  );
}

Aplicador costal1() {
  return Aplicador(
    id: 2,
    modelo: "Jacto",
    capacidadeL: 20,
    capacidadeKG: 20,
    tipo: "bomba costal",
  );
}

Aplicador costal2() {
  return Aplicador(
    id: 3,
    modelo: "Jacto",
    capacidadeL: 20,
    capacidadeKG: 20,
    tipo: "bomba costal",
  );
}

Aplicador costal3() {
  return Aplicador(
    id: 4,
    modelo: "Jacto",
    capacidadeL: 20,
    capacidadeKG: 20,
    tipo: "bomba costal",
  );
}

Aplicador costal4() {
  return Aplicador(
    id: 5,
    modelo: "Jacto",
    capacidadeL: 20,
    capacidadeKG: 20,
    tipo: "bomba costal",
  );
}

Aplicador costal5() {
  return Aplicador(
    id: 6,
    modelo: "Jacto",
    capacidadeL: 20,
    capacidadeKG: 20,
    tipo: "bomba costal",
  );
}

Aplicador costal6() {
  return Aplicador(
    id: 7,
    modelo: "Jacto",
    capacidadeL: 20,
    capacidadeKG: 20,
    tipo: "bomba costal",
  );
}

Aplicador costal7() {
  return Aplicador(
    id: 8,
    modelo: "Jacto",
    capacidadeL: 20,
    capacidadeKG: 20,
    tipo: "bomba costal",
  );
}

Aplicador costal8() {
  return Aplicador(
    id: 9,
    modelo: "Jacto",
    capacidadeL: 20,
    capacidadeKG: 20,
    tipo: "bomba costal",
  );
}

Aplicador costal9() {
  return Aplicador(
    id: 10,
    modelo: "Jacto",
    capacidadeL: 20,
    capacidadeKG: 20,
    tipo: "bomba costal",
  );
}

Aplicador costal10() {
  return Aplicador(
    id: 11,
    modelo: "Jacto",
    capacidadeL: 20,
    capacidadeKG: 20,
    tipo: "bomba costal",
  );
}

//===============================INSUMOS==========================

Insumo bio() {
  return Insumo(
    nome: "BioKiller",
    id: 1,
    unidadeDeMedida: "L",
    tipo: "Inseticida",
  );
}

Insumo amma() {
  return Insumo(
    nome: "Ammoles",
    id: 2,
    unidadeDeMedida: "L",
    tipo: "condicionador",
  );
}

Insumo aca() {
  return Insumo(
    nome: "Acanne",
    id: 3,
    unidadeDeMedida: "L",
    tipo: "Biostimulante",
  );
}

Insumo pol() {
  return Insumo(
    nome: "Polme",
    id: 4,
    unidadeDeMedida: "L",
    tipo: "Biostimulante",
  );
}

Insumo calcio() {
  return Insumo(
    nome: "Alfol Calcio",
    id: 5,
    unidadeDeMedida: "L",
    tipo: "Fertilizante",
  );
}

Insumo bozo() {
  return Insumo(
    nome: "Alfol Boro",
    id: 6,
    unidadeDeMedida: "L",
    tipo: "Fertilizante",
  );
}

Insumo best() {
  return Insumo(
    nome: "Coda Best",
    id: 7,
    unidadeDeMedida: "L",
    tipo: "Biostimulante",
  );
}

Insumo eros() {
  return Insumo(
    nome: "Coda Eros",
    id: 8,
    unidadeDeMedida: "L",
    tipo: "Biostimulante",
  );
}

Insumo drip() {
  return Insumo(
    nome: "Coda Drip",
    id: 9,
    unidadeDeMedida: "L",
    tipo: "Biostimulante",
  );
}

Insumo harmo() {
  return Insumo(
    nome: "Coda Harmony",
    id: 10,
    unidadeDeMedida: "L",
    tipo: "Biostimulante",
  );
}

Insumo spill() {
  return Insumo(
    nome: "Coda Spill",
    id: 11,
    unidadeDeMedida: "L",
    tipo: "Biostimulante",
  );
}

Insumo valu() {
  return Insumo(
    nome: "Valuva",
    id: 12,
    unidadeDeMedida: "L",
    tipo: "Biostimulante",
  );
}

Insumo orke() {
  return Insumo(
    nome: "Orkestra SC",
    id: 13,
    unidadeDeMedida: "L",
    tipo: "Fungicida",
  );
}

Insumo alion() {
  return Insumo(
    nome: "Alion SC500",
    id: 14,
    unidadeDeMedida: "L",
    tipo: "Herbicida",
  );
}

Insumo gali() {
  return Insumo(
    nome: "Galigan",
    id: 15,
    unidadeDeMedida: "L",
    tipo: "Herbicida",
  );
}

Insumo gluc() {
  return Insumo(
    nome: "Glucare",
    id: 16,
    unidadeDeMedida: "L",
    tipo: "Herbicida",
  );
}

Insumo glufo() {
  return Insumo(
    nome: "Glufosinate Ammonium 200 G/L SL",
    id: 17,
    unidadeDeMedida: "L",
    tipo: "Herbicida",
  );
}

Insumo grasi() {
  return Insumo(
    nome: "Grasidim",
    id: 18,
    unidadeDeMedida: "L",
    tipo: "Herbicida",
  );
}

Insumo tremor() {
  return Insumo(
    nome: "Tremor",
    id: 19,
    unidadeDeMedida: "L",
    tipo: "Herbicida",
  );
}

Insumo zart() {
  return Insumo(
    nome: "Zartan",
    id: 20,
    unidadeDeMedida: "g",
    tipo: "Herbicida",
  );
}

Insumo mely() {
  return Insumo(
    nome: "Melyra",
    id: 21,
    unidadeDeMedida: "L",
    tipo: "Fungicida",
  );
}

Insumo opera() {
  return Insumo(nome: "Opera", id: 22, unidadeDeMedida: "L", tipo: "Fungicida");
}

Insumo valp() {
  return Insumo(
    nome: "Valpura EC",
    id: 23,
    unidadeDeMedida: "L",
    tipo: "Fungicida",
  );
}

Insumo curb() {
  return Insumo(
    nome: "Curbix SC200",
    id: 24,
    unidadeDeMedida: "L",
    tipo: "Inseticida",
  );
}

Insumo fast() {
  return Insumo(
    nome: "Fastac",
    id: 25,
    unidadeDeMedida: "L",
    tipo: "Inseticida",
  );
}

Insumo nomo() {
  return Insumo(
    nome: "Nomolt",
    id: 26,
    unidadeDeMedida: "L",
    tipo: "Inseticida",
  );
}

Insumo premi() {
  return Insumo(
    nome: "Premier Plus SC",
    id: 27,
    unidadeDeMedida: "L",
    tipo: "Inseticida",
  );
}

Insumo veran() {
  return Insumo(
    nome: "Verango Prime SC500",
    id: 28,
    unidadeDeMedida: "L",
    tipo: "Nematicida",
  );
}

Insumo supre() {
  return Insumo(
    nome: "Supreme Mineral N1",
    id: 29,
    unidadeDeMedida: "L",
    tipo: "Fertilizante",
  );
}

Insumo refor() {
  return Insumo(
    nome: "Reforce Ultra",
    id: 30,
    unidadeDeMedida: "L",
    tipo: "Fertilizante",
  );
}

Insumo yara() {
  return Insumo(
    nome: "YaraLiva Nitrabo",
    id: 31,
    unidadeDeMedida: "kg",
    tipo: "Fertilizante",
  );
}

Insumo blend() {
  return Insumo(
    nome: "Blend Mg-Zn-B",
    id: 32,
    unidadeDeMedida: "L",
    tipo: "Fertilizante",
  );
}

Insumo trans() {
  return Insumo(
    nome: "Transfer UP",
    id: 33,
    unidadeDeMedida: "L",
    tipo: "Fertilizante",
  );
}

Insumo calSuper() {
  return Insumo(
    nome: "Cal Super",
    id: 34,
    unidadeDeMedida: "L",
    tipo: "Fertilizante",
  );
}

Insumo boroSuper() {
  return Insumo(
    nome: "Boro Super",
    id: 35,
    unidadeDeMedida: "L",
    tipo: "Fertilizante",
  );
}

Insumo ferri() {
  return Insumo(
    nome: "Ferriflo NG",
    id: 36,
    unidadeDeMedida: "L",
    tipo: "Fertilizante",
  );
}

Insumo maxiZinc() {
  return Insumo(
    nome: "Maxi Zinc",
    id: 37,
    unidadeDeMedida: "L",
    tipo: "Fertilizante",
  );
}

Insumo pledge() {
  return Insumo(
    nome: "Pledge",
    id: 38,
    unidadeDeMedida: "L",
    tipo: "Herbicida",
  );
}

Insumo poquer() {
  return Insumo(
    nome: "Poquer",
    id: 39,
    unidadeDeMedida: "L",
    tipo: "Herbicida",
  );
}

Insumo roundup() {
  return Insumo(
    nome: "Roundup Original",
    id: 40,
    unidadeDeMedida: "L",
    tipo: "Herbicida",
  );
}

Insumo cropBest() {
  return Insumo(
    nome: "Crop Best",
    id: 41,
    unidadeDeMedida: "L",
    tipo: "Herbicida",
  );
}

Insumo cropExit() {
  return Insumo(
    nome: "Crop Exit S",
    id: 42,
    unidadeDeMedida: "L",
    tipo: "Herbicida",
  );
}

//Spirit e inseticida + fungicida; o campo tipo so aceita um valor
Insumo spirit() {
  return Insumo(
    nome: "Spirit",
    id: 43,
    unidadeDeMedida: "L",
    tipo: "Inseticida e Fungicida",
  );
}
