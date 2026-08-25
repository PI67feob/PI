//arquivo teste, ignora ele diogo.
import 'class_talhao.dart';
import 'class_area.dart';
import 'class_aplicador.dart';
import 'class_operacao.dart';
import 'class_insumos.dart';



//====================================AREAS===================================================

Area sede (){
  return Area(nome: "Sede", id: 1);
}

//==================TALHOES=====================================================================

Talhao chico1 (Area 1){
  return Talhao(nome: "Chico1", id: 1, ha: 2.80, area: sede);
}
Talhao chico2 (Area 1){
  return Talhao(nome: "Chico2", id:2, ha: 3.80, area: sede);
}
Talhao pinheiro (Area 1){
  return Talhao(nome: "Pinheiro", id:3, ha: 2.05, area: sede);
}
Talhao engenho (Area 1){
  return Talhao(nome: "Engenho", id:4, ha: 4.90, area: sede);
}
Talhao cafeVelho (Area 1){
  return Talhao(nome: "Cafe Velho", id:5, ha: 6.40, area: sede);
}




//area 1 nome da funcao, sempre atribuir o objeto a ela


