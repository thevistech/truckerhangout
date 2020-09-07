import 'package:flutterapp/models/area_unit_model.dart';
import 'package:flutterapp/models/brokers_dashboard.dart';
import 'package:flutterapp/resources/network_services.dart';
import 'package:flutterapp/resources/network_calls_apis.dart';
import 'package:mobx/mobx.dart';
import 'package:flutterapp/models/area_unit_model.dart' as areaUnit;
part 'create_property_store.g.dart';

enum LoadingState { none, loading, error }

class CreatePropertyStore = _CreatePropertyStore with _$CreatePropertyStore;

abstract class _CreatePropertyStore with Store {
  final FormErrorState error = FormErrorState();
  List<ReactionDisposer> _disposers;
  NetworkService networkService = new NetworkService();
 
  @observable
  String localeNames;
  @observable
  String localeID;

  void setupValidations() {
    _disposers = [];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @computed
  bool get hasErrors => areaUnit.Datum != null;
}
