import 'dart:math';
import 'package:flutter/material.dart';

class Financiamento extends StatefulWidget {
  @override
  State<Financiamento> createState() => _FinanciamentoState();
}

class _FinanciamentoState extends State<Financiamento> {
  double valor = 0;
  double juros = 0;
  double taxas = 0;
  int parcelas = 0;

  double total = 0;
  double valorParcela = 0;

  void calcular() {
    // Montante com juros compostos + taxas
    total = (valor + taxas) * pow(1 + juros, parcelas);

    // Valor da parcela
    valorParcela = total / parcelas;

    setState(() {});

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Resultado"),
        content: Text(
          "Total: R\$ ${total.toStringAsFixed(2)}\n"
          "Parcela: R\$ ${valorParcela.toStringAsFixed(2)}",
        ),
      ),
    );
  }

  InputDecoration campo(String texto) {
    return InputDecoration(
      labelText: texto,
      border: OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simulador de Financiamento"),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: campo("Valor do bem"),
              keyboardType: TextInputType.number,
              onChanged: (v) => valor = double.parse(v),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: campo("Número de parcelas"),
              keyboardType: TextInputType.number,
              onChanged: (v) => parcelas = int.parse(v),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: campo("Taxa de juros (ex: 0.02)"),
              keyboardType: TextInputType.number,
              onChanged: (v) => juros = double.parse(v),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: campo("Taxas adicionais"),
              keyboardType: TextInputType.number,
              onChanged: (v) => taxas = double.parse(v),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcular,
              child: Text("Calcular"),
            ),
            SizedBox(height: 20),

            // RESULTADOS NA TELA
            Text("Total: R\$ ${total.toStringAsFixed(2)}"),
            Text("Parcela: R\$ ${valorParcela.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}