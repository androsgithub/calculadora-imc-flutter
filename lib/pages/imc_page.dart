import 'package:calculadora_imc_flutter/classes/Pessoa.dart';
import 'package:flutter/material.dart';

class IMCPage extends StatefulWidget {
  IMCPage({super.key});

  @override
  State<IMCPage> createState() => _IMCPageState();
}

class _IMCPageState extends State<IMCPage> {
  TextEditingController pesoController = TextEditingController(text: "");

  TextEditingController alturaController = TextEditingController(text: "");

  Pessoa? pessoa;

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
                    pessoa = Pessoa(double.parse(pesoController.text),
                        double.parse(alturaController.text));
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
              child: pessoa != null
                  ? Text(
                      "Peso: ${pessoa!.altura}\nPeso: ${pessoa!.peso}\nIMC: ${pessoa!.calcularIMC().toStringAsFixed(2)}")
                  : null,
            ),
          ],
        ),
      )),
    );
  }
}
