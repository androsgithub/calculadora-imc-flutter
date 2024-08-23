import 'package:calculadora_imc_flutter/classes/pessoa_model.dart';
import 'package:hive_flutter/adapters.dart';

class PessoaRepository {
  static late Box _box;
  static const String _boxName = "box_pessoa";

  PessoaRepository._criar();
  static Future<PessoaRepository> load() async {
    if (Hive.isBoxOpen(_boxName)) {
      _box = Hive.box(_boxName);
    } else {
      _box = await Hive.openBox(_boxName);
    }
    return PessoaRepository._criar();
  }

  salvar(PessoaModel pessoaModel) {
    _box.put(_boxName, pessoaModel);
  }

  PessoaModel obterDados() {
    return _box.get(_boxName);
  }
}
