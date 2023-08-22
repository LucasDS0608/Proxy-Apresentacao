class ProxyMessageModel {
  List<String> _messages = [];
  bool _mustUpdate = false;
  int _countGet = 0;

  ProxyMessageModel(this._messages);

  List<String> getMessages() {
    this._countGet++;

    if (_mustUpdate) {
      // Vai ao servidor e baixa as mensagens novamente....
    }



    return _messages;
  }
}