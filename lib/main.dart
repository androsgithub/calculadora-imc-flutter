import 'package:calculadora_imc_flutter/classes/pessoa_model.dart';
import 'package:calculadora_imc_flutter/my_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  var documentPath = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentPath.path);
  Hive.registerAdapter(PessoaModelAdapter());

  runApp(const MyApp());
}
