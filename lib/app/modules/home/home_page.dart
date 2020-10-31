import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:intl/intl.dart';
import 'package:nkey/app/shared/models/moeda_model.dart';

import 'home_bloc.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<bool>(
          stream: controller.getValidate,
          initialData: false,
          builder: (context, snapshotValidate) {
            return Form(
              key: controller.formKey,
              autovalidateMode: snapshotValidate.data
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Icon(
                          Icons.monetization_on_rounded,
                          color: Theme.of(context).accentColor,
                          size: 120,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: StreamBuilder<String>(
                              stream: controller.getMoedaOrigem,
                              builder: (context, snapshot) {
                                return DropdownButtonFormField(
                                  dropdownColor: Colors.orangeAccent,
                                  isDense: true,
                                  decoration: InputDecoration(
                                    labelText: "Moeda Origem",
                                    alignLabelWithHint: true,
                                    fillColor: Theme.of(context)
                                        .accentColor
                                        .withOpacity(.5),
                                    filled: true,
                                  ),
                                  value: snapshot.data,
                                  items: controller.tipoMoedas
                                      .map((label) => DropdownMenuItem(
                                            child: Center(child: Text(label)),
                                            value: label,
                                          ))
                                      .toList(),
                                  onChanged: controller.setMoedaOrigem,
                                  validator: (v) =>
                                      v == null || v.trim().isEmpty
                                          ? "Informe a moeda origem"
                                          : null,
                                );
                              }),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            children: [
                              StreamBuilder<String>(
                                  stream: controller.getMoedaDestino,
                                  builder: (context, snapshot) {
                                    return DropdownButtonFormField(
                                      value: snapshot.data,
                                      dropdownColor: Colors.orangeAccent,
                                      decoration: InputDecoration(
                                        labelText: "Moeda Destino",
                                        alignLabelWithHint: true,
                                        fillColor: Theme.of(context)
                                            .accentColor
                                            .withOpacity(.5),
                                        filled: true,
                                      ),
                                      items: controller.tipoMoedas
                                          .map((label) => DropdownMenuItem(
                                                child: Center(
                                                  child: Text(
                                                    label,
                                                  ),
                                                ),
                                                value: label,
                                              ))
                                          .toList(),
                                      onChanged: controller.setMoedaDestino,
                                      validator: (v) =>
                                          v == null || v.trim().isEmpty
                                              ? "Informe a moeda destino"
                                              : null,
                                    );
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: controller.controllerMoedaOrigem,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                          prefix: StreamBuilder<String>(
                              stream: controller.getMoedaOrigem,
                              initialData: '',
                              builder: (context, snapshotOrigem) {
                                return Text(
                                  '${snapshotOrigem.data ?? ''} ',
                                );
                              }),
                          labelText: 'Valor à calcular',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                      validator: (v) =>
                          v.trim().isEmpty ? "Informe o valor" : null,
                    ),
                    const SizedBox(height: 20),
                    Center(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: ProgressButton(
                        defaultWidget: Text(
                          'Calcular',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        progressWidget: const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white)),
                        height: 50,
                        color: Theme.of(context).accentColor.withOpacity(.6),
                        onPressed: controller.calcularMoeda,
                      ),
                    )),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.controllerMoedaDestino,
                      keyboardType: TextInputType.numberWithOptions(),
                      readOnly: true,
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                          labelText: 'Valor convertido',
                          prefix: StreamBuilder<String>(
                              stream: controller.getMoedaDestino,
                              initialData: '',
                              builder: (context, snapshotDestino) {
                                return Text(
                                  '${snapshotDestino.data ?? ''} ',
                                  style: TextStyle(
                                      color: Colors.orangeAccent,
                                      fontWeight: FontWeight.normal),
                                );
                              }),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton.icon(
                            color: Colors.orangeAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: controller.limparDados,
                            icon: Icon(Icons.clear),
                            label: Text('Limpar')),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: StreamBuilder<MoedaModel>(
                                  stream: controller.getMoeda,
                                  builder: (context, snapshot) {
                                    if (snapshot.data == null) {
                                      return Container();
                                    }
                                    return Text(!snapshot.data.atualizado
                                        ? 'Último atualização: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(snapshot.data.date))}'
                                        : 'Atualizado ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}');
                                  }),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
