import 'dart:convert';
import 'package:flutterapp/models/auth_model.dart';
import 'package:flutterapp/resources/network_services.dart';
import 'package:flutterapp/resources/network_calls_apis.dart';
import 'package:mobx/mobx.dart';

part 'sign_in_store.g.dart';

enum LoadingState { none, loading, error }

class SignInStore = _SignInStore with _$SignInStore;

abstract class _SignInStore with Store {
  final FormErrorState error = FormErrorState();
  List<ReactionDisposer> _disposers;
  NetworkService networkService = new NetworkService();
  AuthModel authModel = new AuthModel();

  @observable
  String email = '';
  @observable
  String password = '';

  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

/* 
  @action
  void validatePassword(String value) {
    error.password = value.isEmpty ? 'Password cannot be empty' :(value.length<8?"Password length should be greater than 8":null);
  }
 */
  @action
  void validatePassword(String value) {
    error.password = value.isEmpty ? 'Password cannot be empty' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = value.isEmpty ? 'Email or number cannot be empty' : null;
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  @action
  bool checkIfEmailAndPasswordAreEmpty(String email, String password) {
    if (email.isEmpty || password.isEmpty)
      return true;
    else
      return false;
  }

  bool validateEmailAndPassword() {
    return checkIfEmailAndPasswordAreEmpty(email, password);
  }

  void validateAll() {
    validatePassword(password);
    validateEmail(email);
  }

  Future<AuthModel> getTheUsers(context) async {
    authModel =
        await networkService.outhUser(outhUserApi, email, password, context);
    return authModel;
  }

  @observable
  List<AuthModel> authUser;

  @observable
  LoadingState state = LoadingState.loading;

  @computed
  int get facts => authUser.length;
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String email;

  @observable
  String password;

  @computed
  bool get hasErrors => email != null || password != null;
}
