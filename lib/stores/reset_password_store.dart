import 'package:flutterapp/models/forget_password.dart';
import 'package:flutterapp/resources/network_services.dart';
import 'package:flutterapp/stores/send_code_store.dart';
import 'package:flutterapp/resources/network_calls_apis.dart';
import 'package:mobx/mobx.dart';

import '../resources/network_calls_apis.dart';
part 'reset_password_store.g.dart';
class ResetPasswordStore = _ResetPasswordStore with _$ResetPasswordStore;
abstract class _ResetPasswordStore with Store{


  NetworkService networkService =new NetworkService();
  Forgetpassword forgetpassword = new Forgetpassword();


  @observable
  String code = '';

  @observable
  String mobileNumber = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';



  List<ReactionDisposer> _disposer;
  final FormErrorState error = FormErrorState();

  void setupValidations() {
    _disposer = [
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword)
    ];
  }

  @action
  void validatePassword(String value) {
    error.password = value.isEmpty ? 'Add password in filed' : (value.length < 6 ? "Password is too short":null);
  }

  @action
  void validateConfirmPassword(String value) {
    error.confirmPassword = value.isEmpty ? 'Add confirm password in files' : (value!=password?"Password does not matches":null);
  }

  Future<Forgetpassword> resetPassword(context) async {
    print(code);
    forgetpassword = await networkService.resetPassword(resetPasswordApi,code,mobileNumber,password, context);
    return forgetpassword;
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
  String password;

  @observable
  String confirmPassword;
  @computed
  bool get hasErrors => password != null || confirmPassword!=null;
}
