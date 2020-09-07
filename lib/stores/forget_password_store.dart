import 'package:flutterapp/models/forget_password.dart';
import 'package:flutterapp/resources/network_services.dart';
import 'package:flutterapp/stores/send_code_store.dart';
import 'package:flutterapp/resources/network_calls_apis.dart';
import 'package:mobx/mobx.dart';
import 'package:flutterapp/models/country_code_model.dart' as countryModel;

part 'forget_password_store.g.dart';

class ForgetPasswordStore = _ForgetPasswordStore with _$ForgetPasswordStore;

abstract class _ForgetPasswordStore with Store {
  NetworkService networkService = new NetworkService();
  Forgetpassword forgetpassword = new Forgetpassword();

  @observable
  String email = '';

  @observable
  String code = '92';

  @observable
  String number = '';

  @observable
  bool isMobileCodeLoaded = false;
  
  @observable
  countryModel.Datum countryCodeAndFlag;

  List<ReactionDisposer> _disposer;
  final FormErrorState error = FormErrorState();

  void setupValidations() {
    _disposer = [
      reaction((_) => email, validateNumber),
      reaction((_) => code, validateCode)
    ];
  }

  @action
  void validateNumber(String value) {
    error.number = value.isEmpty ? 'Number should not less than 8' : null;
  }

  @action
  void validateCode(String value) {
    error.number = value.isEmpty ? 'Code should not be empty' : null;
  }

  Future<Forgetpassword> userforgetPassword(context) async {
    forgetpassword = await networkService.forgetPassword(
        forgetPassApi, code, number, context);
    return forgetpassword;
  }

  @action
  Future<countryModel.CountryCodeModel> getCountryCodes(context) async {
    return networkService.getCountryCodes(getCountryCode, context);
  }

  String getEmail() {
    return email;
  }

  void dispose() {
    for (final d in _disposer) {
      d();
    }
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String code;

  @observable
  String number;
  @computed
  bool get hasErrors => code != null || number != null;
}
