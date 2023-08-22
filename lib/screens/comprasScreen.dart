import 'package:flutter/material.dart';
import 'package:proxyexample/widgets/escolhaPagamento.dart';

class ComprasScreen extends StatelessWidget {
  const ComprasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comprar'),
      ),
      body: EscolhaPagamento(),
    );
  }
}
