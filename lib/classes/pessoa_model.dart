import 'package:hive_flutter/adapters.dart';
part 'pessoa_model.g.dart';

@HiveType(typeId: 0)
class PessoaModel extends HiveObject {
  @HiveField(0)
  double? peso;
  @HiveField(1)
  double? altura;

  PessoaModel.noParams() {
    peso = 0;
    altura = 0;
  }
  PessoaModel(this.peso, this.altura);

  double calcularIMC() {
    if (peso != null && altura != null) {
      return peso! / (altura! * altura!);
    }
    return 0.0;
  }
}
