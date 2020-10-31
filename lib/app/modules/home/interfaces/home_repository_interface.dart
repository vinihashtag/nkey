import 'package:flutter_modular/flutter_modular.dart';
import 'package:nkey/app/shared/models/moeda_model.dart';

abstract class IHomeRepository implements Disposable {
  Future<MoedaModel> getMoedasByBase(String base);
}
