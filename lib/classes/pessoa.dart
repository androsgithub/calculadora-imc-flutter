class Pessoa {
  double peso = 0;
  double altura = 0;

  Pessoa(this.peso, this.altura);

  double calcularIMC() {
    return peso / (altura * altura);
  }
}
