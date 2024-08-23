import 'package:calculadora_imc_flutter/classes/pessoa_model.dart';
import 'package:calculadora_imc_flutter/repositories/pessoa_repository.dart';
import 'package:flutter/material.dart';

class IMCPage extends StatefulWidget {
  const IMCPage({super.key});

  @override
  State<IMCPage> createState() => _IMCPageState();
}

class _IMCPageState extends State<IMCPage> {
  late PessoaRepository pessoaRepository;
  TextEditingController pesoController = TextEditingController(text: "");

  TextEditingController alturaController = TextEditingController(text: "");

  PessoaModel pessoa = PessoaModel.noParams();
  @override
  void initState() {
    super.initState();
    carregar();
  }

  carregar() async {
    pessoaRepository = await PessoaRepository.load();
    pessoa = pessoaRepository.obterDados();
    pesoController.text = (pessoa.peso ?? 0).toString();
    alturaController.text = (pessoa.altura ?? 0).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora IMC"),
      ),
      body: Expanded(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Insira seu peso e altura para calcular o IMC",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
                controller: pesoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Peso"),
                )),
            const SizedBox(height: 10),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text("Altura")),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    pessoa.altura = double.tryParse(alturaController.text) ?? 0;
                    pessoa.peso = double.tryParse(pesoController.text) ?? 0;
                    pessoaRepository.salvar(pessoa);
                  });
                },
                style: const ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
                    backgroundColor: WidgetStatePropertyAll(Colors.green)),
                child: const Text(
                  "CALCULAR",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              child: pessoa.altura != 0 && pessoa.peso != 0
                  ? Text(
                      "Peso: ${pessoa.altura}\nPeso: ${pessoa.peso}\nIMC: ${pessoa.calcularIMC().toStringAsFixed(2)}")
                  : null,
            ),
          ],
        ),
      )),
    );
  }
}
