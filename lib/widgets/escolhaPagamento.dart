import 'package:flutter/material.dart';
import 'package:proxyexample/models/pagamentoModel.dart';
import 'package:proxyexample/widgets/shoppingCartWidget.dart';
import 'package:proxyexample/models/proxyModel.dart';

class EscolhaPagamento extends StatefulWidget {
  const EscolhaPagamento({super.key});

  @override
  State<EscolhaPagamento> createState() => _EscolhaPagamentoState();
}

class _EscolhaPagamentoState extends State<EscolhaPagamento> {
  final PaymentProxy pagamentoSelecionado = PaymentProxy('Nenhum pagamento selecionado');

  Widget construirOpcoes(String option) {
    return ListTile(
      title: Text(option),
      onTap: () {
        setState(() {
          pagamentoSelecionado.selectedPayment = option;
        });
        Navigator.of(context).pop();
      },
    );
  }

  void mostrarEscolhas(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Escolha a Forma de Pagamento'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              construirOpcoes(PaymentOptions.cartaoCredito),
              construirOpcoes(PaymentOptions.paypal),
              construirOpcoes(PaymentOptions.boleto),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Valor da compra total: ${ShoppingCartWidget.of(context)!.total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Forma de Pagamento Selecionada:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              pagamentoSelecionado.selectedPayment!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                mostrarEscolhas(context);
              },
              child: Text('Escolher Forma de Pagamento'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

                if(pagamentoSelecionado.permicaoUsuario){
                  ShoppingCartWidget.of(context)!.products.clear();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Compra realizada via ${pagamentoSelecionado.selectedPayment!}'),
                  ));
                }

              },
              child: Text('Comprar'),
            ),
          ],
        ),
      ),
    );
  }
}
