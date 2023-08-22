class PaymentProxy {
  String? pagamentoEscolhido;
  bool permicaoUsuario = true;

  PaymentProxy(this.pagamentoEscolhido);

  String get selectedPayment => (pagamentoEscolhido ?? "");

  void set selectedPayment(String value) {

    if (!permicaoUsuario)
      throw "Você não possuí acesso para editar o pagamento escolhido.";

    this.pagamentoEscolhido = value;
  }
}