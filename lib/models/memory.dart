class Memory {
  static const operations = const ['%', '/', '+', '-', 'x', '='];

  String _value = '0';
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String _operation;
  bool _wipeValue = false;
  String _lastCommand;

  //metodo apply dos comando dos botoes
  void applyCommand(String command) {
    if (_isReplacingOperation(command)) {
      _operation = command;
      return;
    }

    if (command == 'AC') {
      _allClear();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }

    _lastCommand = command;
  }

  //
  _isReplacingOperation(String command) {
    return operations.contains(_lastCommand) &&
        operations.contains(command) &&
        _lastCommand != '=' &&
        command != '=';
  }

  //metodo operation e os buffer
  _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';

    if (_bufferIndex == 0) {
      if (!isEqualSign) {
        _operation = newOperation;
        _bufferIndex = 1;
        _wipeValue = true;
      }
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;

      _operation = isEqualSign ? null : newOperation;
      _bufferIndex = isEqualSign ? 0 : 1;
    }

    _wipeValue = true; //!isEqualSign;
  }

  //metodo para adicionar digito
  _addDigit(String digit) {
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;

    //if de configurar para aparecer so um .
    if (isDot && _value.contains('.') && !wipeValue) {
      return;
    }

    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    //passando o valor do value para double no buffer
    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
    print(_buffer);
  }

  //metodo de limpar os buffer
  _allClear() {
    _value = '0';
    _buffer[0] = 0;
    _buffer[1] = 0;
    _operation = null;
    _bufferIndex = 0;
    _wipeValue = false;
  }

  //metodo para calcular o valor do buffer 0 e 1
  _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      default:
        return _buffer[0];
    }
  }

  String get value {
    return _value;
  }
}
