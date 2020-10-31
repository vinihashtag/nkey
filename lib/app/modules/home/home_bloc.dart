import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nkey/app/modules/home/interfaces/home_repository_interface.dart';
import 'package:nkey/app/shared/models/moeda_model.dart';
import 'package:nkey/app/shared/utils/snackbar.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Disposable {
  final IHomeRepository _repository;

  HomeBloc(this._repository);

  // * Variaveis
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController controllerMoedaOrigem = TextEditingController();
  final TextEditingController controllerMoedaDestino = TextEditingController();
  final tipoMoedas = [
    "CAD",
    "HKD",
    "ISK",
    "PHP",
    "DKK",
    "HUF",
    "CZK",
    "AUD",
    "RON",
    "SEK",
    "IDR",
    "INR",
    "BRL",
    "RUB",
    "HRK",
    "JPY",
    "THB",
    "CHF",
    "SGD",
    "PLN",
    "BGN",
    "TRY",
    "CNY",
    "NOK",
    "NZD",
    "ZAR",
    "USD",
    "MXN",
    "ILS",
    "GBP",
    "KRW",
    "MYR",
  ];

  // * Streams
  final _moedaStream = BehaviorSubject<MoedaModel>();
  Function(MoedaModel) get setMoeda =>
      _moedaStream.isClosed ? (v) => v : _moedaStream.add;
  Stream<MoedaModel> get getMoeda => _moedaStream.stream;

  final _moedaOrigem = BehaviorSubject<String>();
  Function(String) get setMoedaOrigem =>
      _moedaOrigem.isClosed ? (v) => v : _moedaOrigem.add;

  Stream<String> get getMoedaOrigem => _moedaOrigem.stream;

  final _moedaDestino = BehaviorSubject<String>();
  void setMoedaDestino(String v) {
    if (_moedaDestino.isClosed) {
      return;
    } else {
      controllerMoedaDestino.clear();
      _moedaDestino.add(v);
    }
  }

  Stream<String> get getMoedaDestino => _moedaDestino.stream;

  final _validateStream = BehaviorSubject<bool>();
  Function(bool) get setValidate =>
      _validateStream.isClosed ? (v) => v : _validateStream.add;
  Stream<bool> get getValidate => _validateStream.stream;

  // * Retorna a lista de moeda e o calculo
  Future<void> calcularMoeda() async {
    if (!formKey.currentState.validate()) {
      return setValidate(true);
    }

    SystemChannels.textInput.invokeMethod('TextInput.hide');
    try {
      controllerMoedaDestino.clear();
      final moedas = await _repository.getMoedasByBase(_moedaOrigem.value);

      var valor = double.parse(controllerMoedaOrigem.text);
      switch (_moedaDestino.value) {
        case "CAD":
          controllerMoedaDestino.text =
              (valor * moedas.rates.cAD).toStringAsFixed(2);
          break;
        case "HKD":
          controllerMoedaDestino.text =
              (valor * moedas.rates.hKD).toStringAsFixed(2);
          break;
        case "ISK":
          controllerMoedaDestino.text =
              (valor * moedas.rates.iSK).toStringAsFixed(2);
          break;
        case "PHP":
          controllerMoedaDestino.text =
              (valor * moedas.rates.pHP).toStringAsFixed(2);
          break;
        case "DKK":
          controllerMoedaDestino.text =
              (valor * moedas.rates.dKK).toStringAsFixed(2);
          break;
        case "HUF":
          controllerMoedaDestino.text =
              (valor * moedas.rates.cAD).toStringAsFixed(2);
          break;
        case "CZK":
          controllerMoedaDestino.text =
              (valor * moedas.rates.cZK).toStringAsFixed(2);
          break;
        case "RON":
          controllerMoedaDestino.text =
              (valor * moedas.rates.rON).toStringAsFixed(2);
          break;
        case "SEK":
          controllerMoedaDestino.text =
              (valor * moedas.rates.sEK).toStringAsFixed(2);
          break;
        case "IDR":
          controllerMoedaDestino.text =
              (valor * moedas.rates.iDR).toStringAsFixed(2);
          break;
        case "INR":
          controllerMoedaDestino.text =
              (valor * moedas.rates.iNR).toStringAsFixed(2);
          break;
        case "BRL":
          controllerMoedaDestino.text =
              (valor * moedas.rates.bRL).toStringAsFixed(2);
          break;
        case "RUB":
          controllerMoedaDestino.text =
              (valor * moedas.rates.rUB).toStringAsFixed(2);
          break;
        case "HRK":
          controllerMoedaDestino.text =
              (valor * moedas.rates.hRK).toStringAsFixed(2);
          break;
        case "JPY":
          controllerMoedaDestino.text =
              (valor * moedas.rates.jPY).toStringAsFixed(2);
          break;
        case "THB":
          controllerMoedaDestino.text =
              (valor * moedas.rates.tHB).toStringAsFixed(2);
          break;
        case "CHF":
          controllerMoedaDestino.text =
              (valor * moedas.rates.cHF).toStringAsFixed(2);
          break;
        case "SGD":
          controllerMoedaDestino.text =
              (valor * moedas.rates.sGD).toStringAsFixed(2);
          break;
        case "PLN":
          controllerMoedaDestino.text =
              (valor * moedas.rates.pLN).toStringAsFixed(2);
          break;
        case "BGN":
          controllerMoedaDestino.text =
              (valor * moedas.rates.bGN).toStringAsFixed(2);
          break;
        case "TRY":
          controllerMoedaDestino.text =
              (valor * moedas.rates.tRY).toStringAsFixed(2);
          break;
        case "CNY":
          controllerMoedaDestino.text =
              (valor * moedas.rates.cNY).toStringAsFixed(2);
          break;
        case "NOK":
          controllerMoedaDestino.text =
              (valor * moedas.rates.nOK).toStringAsFixed(2);
          break;
        case "NZD":
          controllerMoedaDestino.text =
              (valor * moedas.rates.nZD).toStringAsFixed(2);
          break;
        case "ZAR":
          controllerMoedaDestino.text =
              (valor * moedas.rates.zAR).toStringAsFixed(2);
          break;
        case "USD":
          controllerMoedaDestino.text =
              (valor * moedas.rates.uSD).toStringAsFixed(2);
          break;
        case "MXN":
          controllerMoedaDestino.text =
              (valor * moedas.rates.mXN).toStringAsFixed(2);
          break;
        case "ILS":
          controllerMoedaDestino.text =
              (valor * moedas.rates.iLS).toStringAsFixed(2);
          break;
        case "GBP":
          controllerMoedaDestino.text =
              (valor * moedas.rates.gBP).toStringAsFixed(2);
          break;
        case "KRW":
          controllerMoedaDestino.text =
              (valor * moedas.rates.kRW).toStringAsFixed(2);
          break;
        case "MYR":
          controllerMoedaDestino.text =
              (valor * moedas.rates.mYR).toStringAsFixed(2);
          break;

        default:
          return SnackBarCustom.snackBarTop(
              mensagem: 'Moeda não implementada!',
              icon: Icon(Icons.error_outline, color: Colors.red));
      }

      setMoeda(moedas);
    } catch (e) {
      print(e);
      _moedaStream.addError('Erro ao buscar moedas, verifique');
      if (e is DioError &&
          (e.type == DioErrorType.DEFAULT ||
              e.type == DioErrorType.CONNECT_TIMEOUT)) {
        SnackBarCustom.snackBarTop(
            mensagem: 'Verifique sua conexão de internet!',
            icon: Icon(Icons.error_outline, color: Colors.red));
      }
    }
  }

  void limparDados() {
    setMoeda(null);
    setMoedaOrigem(null);
    setMoedaDestino(null);
    controllerMoedaOrigem.clear();
    controllerMoedaDestino.clear();
  }

  @override
  void dispose() {
    _moedaStream?.close();
    _moedaOrigem?.close();
    _moedaDestino?.close();
    _validateStream?.close();
  }
}
