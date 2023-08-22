class PaymentProxy {
  String? pagamentoEscolhido;
  bool permicaoUsuario = true; // Simplesmente assumimos que o usuário tem permissão.

  // Construtor
  PaymentProxy(this.pagamentoEscolhido);

  // Método para definir a forma de pagamento (com verificação de permissão)

  /*
  void escolherPagamento(String paymentType) {
    if (permicaoUsuario)
      pagamentoEscolhido = paymentType;
    else
      // Lidar com a falta de permissão (por exemplo, mostrar uma mensagem de erro).
      pagamentoEscolhido = 'Sem permissão para selecionar';

  }
   */

  // Método para obter a forma de pagamento selecionada
  String get selectedPayment => (pagamentoEscolhido ?? "");

  void set selectedPayment(String value) {

    if (!permicaoUsuario)
      throw "Você não possuí acesso para editar o pagamento escolhido.";

    this.pagamentoEscolhido = value;
  }
}