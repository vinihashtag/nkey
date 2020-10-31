class MoedaModel {
  Rates rates;
  String base;
  String date;
  bool atualizado;

  MoedaModel({this.rates, this.base, this.date, this.atualizado});

  MoedaModel.fromJson(Map<String, dynamic> json) {
    rates = json['rates'] != null ? new Rates.fromJson(json['rates']) : null;
    base = json['base'];
    date = json['date'];
    atualizado = json['atualizado'] ?? true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rates != null) {
      data['rates'] = this.rates.toJson();
    }
    data['base'] = this.base;
    data['date'] = this.date;
    data['atualizado'] = this.atualizado;
    return data;
  }

  @override
  String toString() {
    return 'MoedaModel(rates: $rates, base: $base, date: $date, atualizado: $atualizado)';
  }
}

class Rates {
  double cAD;
  double hKD;
  double iSK;
  double pHP;
  double dKK;
  double hUF;
  double cZK;
  double gBP;
  double rON;
  double sEK;
  double iDR;
  double iNR;
  double bRL;
  double rUB;
  double hRK;
  double jPY;
  double tHB;
  double cHF;
  double eUR;
  double mYR;
  double bGN;
  double tRY;
  double cNY;
  double nOK;
  double nZD;
  double zAR;
  double uSD;
  double mXN;
  double sGD;
  double aUD;
  double iLS;
  double kRW;
  double pLN;

  Rates(
      {this.cAD,
      this.hKD,
      this.iSK,
      this.pHP,
      this.dKK,
      this.hUF,
      this.cZK,
      this.gBP,
      this.rON,
      this.sEK,
      this.iDR,
      this.iNR,
      this.bRL,
      this.rUB,
      this.hRK,
      this.jPY,
      this.tHB,
      this.cHF,
      this.eUR,
      this.mYR,
      this.bGN,
      this.tRY,
      this.cNY,
      this.nOK,
      this.nZD,
      this.zAR,
      this.uSD,
      this.mXN,
      this.sGD,
      this.aUD,
      this.iLS,
      this.kRW,
      this.pLN});

  Rates.fromJson(Map<String, dynamic> json) {
    cAD = json['CAD'];
    hKD = json['HKD'];
    iSK = json['ISK'];
    pHP = json['PHP'];
    dKK = json['DKK'];
    hUF = json['HUF'];
    cZK = json['CZK'];
    gBP = json['GBP'];
    rON = json['RON'];
    sEK = json['SEK'];
    iDR = json['IDR'];
    iNR = json['INR'];
    bRL = json['BRL'];
    rUB = json['RUB'];
    hRK = json['HRK'];
    jPY = json['JPY'];
    tHB = json['THB'];
    cHF = json['CHF'];
    eUR = json['EUR'];
    mYR = json['MYR'];
    bGN = json['BGN'];
    tRY = json['TRY'];
    cNY = json['CNY'];
    nOK = json['NOK'];
    nZD = json['NZD'];
    zAR = json['ZAR'];
    uSD = json['USD'];
    mXN = json['MXN'];
    sGD = json['SGD'];
    aUD = json['AUD'];
    iLS = json['ILS'];
    kRW = json['KRW'];
    pLN = json['PLN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CAD'] = this.cAD;
    data['HKD'] = this.hKD;
    data['ISK'] = this.iSK;
    data['PHP'] = this.pHP;
    data['DKK'] = this.dKK;
    data['HUF'] = this.hUF;
    data['CZK'] = this.cZK;
    data['GBP'] = this.gBP;
    data['RON'] = this.rON;
    data['SEK'] = this.sEK;
    data['IDR'] = this.iDR;
    data['INR'] = this.iNR;
    data['BRL'] = this.bRL;
    data['RUB'] = this.rUB;
    data['HRK'] = this.hRK;
    data['JPY'] = this.jPY;
    data['THB'] = this.tHB;
    data['CHF'] = this.cHF;
    data['EUR'] = this.eUR;
    data['MYR'] = this.mYR;
    data['BGN'] = this.bGN;
    data['TRY'] = this.tRY;
    data['CNY'] = this.cNY;
    data['NOK'] = this.nOK;
    data['NZD'] = this.nZD;
    data['ZAR'] = this.zAR;
    data['USD'] = this.uSD;
    data['MXN'] = this.mXN;
    data['SGD'] = this.sGD;
    data['AUD'] = this.aUD;
    data['ILS'] = this.iLS;
    data['KRW'] = this.kRW;
    data['PLN'] = this.pLN;
    return data;
  }

  @override
  String toString() {
    return 'Rates(cAD: $cAD, hKD: $hKD, iSK: $iSK, pHP: $pHP, dKK: $dKK, hUF: $hUF, cZK: $cZK, gBP: $gBP, rON: $rON, sEK: $sEK, iDR: $iDR, iNR: $iNR, bRL: $bRL, rUB: $rUB, hRK: $hRK, jPY: $jPY, tHB: $tHB, cHF: $cHF, eUR: $eUR, mYR: $mYR, bGN: $bGN, tRY: $tRY, cNY: $cNY, nOK: $nOK, nZD: $nZD, zAR: $zAR, uSD: $uSD, mXN: $mXN, sGD: $sGD, aUD: $aUD, iLS: $iLS, kRW: $kRW, pLN: $pLN)';
  }
}
