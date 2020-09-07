import 'package:flutterapp/models/auth_model.dart';
import 'package:flutterapp/models/country_code_model.dart' as countryModel;
import 'package:flutterapp/models/forget_password.dart';
import 'package:flutterapp/resources/network_calls_apis.dart';
import 'package:flutterapp/resources/network_services.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:mobx/mobx.dart';
import '../models/lcoation_content_model.dart';
import '../models/company_model.dart' as companiesModel;
part 'signup_store.g.dart';

enum LoadingState { none, loading }

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  final FormErrorState error = FormErrorState();
  List<ReactionDisposer> _disposers;
  NetworkService networkService = new NetworkService();
  Forgetpassword baseModel = new Forgetpassword();

  @observable
  bool isMobileCodeLoaded = false;
  @observable
  var isLoadingMobile = LoadingState.none;
  @observable
  var isLoadingEmail = LoadingState.none;
  @observable
  bool userNameValid = false;
  @observable
  bool emailValid = false;
  @observable
  bool mobileNumberValid = false;
  @observable
  String name = '';
  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  String mobileNumber = '';
  @observable
  String address = '';
  @observable
  String country = '';
  @observable
  String city = '';
  @observable
  String postalCode = '';
  @observable
  bool acceptTerms = false;
  @observable
  String location = '';
  @observable
  String company = '';
  @observable
  bool isMale = true;
  @observable
  countryModel.Datum countryCodeAndFlag;
  @observable
  companiesModel.CompanyDialog companyDialog;
  @observable
  companiesModel.Datum companyDialogItemValue;
  @observable
  var userLoginAs = UserType.VISITOR;

  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => name, validateName),
      reaction((_) => mobileNumber, validateNumber),
      reaction((_) => address, validateAddress),
      reaction((_) => country, validateCountry),
      reaction((_) => city, validateCity),
      reaction((_) => postalCode, validatePostalCode),
      reaction((_) => acceptTerms, validateTerms),
      reaction((_) => location, validateLocation),
      reaction((_) => userLoginAs, validateUserType),
      reaction((_) => company, validateCompany),
    ];
  }

  @action
  void validateName(String value) {
    error.fullName = (value.isEmpty || value == null)
        ? 'Name cannot be empty'
        : (value.length < 8 ? "Name should be greater than 8" : null);
  }

  @action
  void validatePassword(String value) {
    error.password = value.isEmpty
        ? 'Password cannot be empty'
        : (value.length < 8 ? "Password should be greater than 8" : null);
  }

  @action
  void validateEmail(String value) {
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);
    // error.email = value.isEmpty ? 'Email cannot be empty' : null;
    if (value.isEmpty) {
      error.email = 'Email cant be empty';
    } else if (!regExp.hasMatch(value)) {
      // So, the email is valid
      // The pattern of the email didn't match the regex above.
      error.email = 'Email is not valid';
    } else
      error.email = null;
  }

  @action
  void validateNumber(String value) {
    error.mobileNumber = value.isEmpty
        ? 'Mobile Number cannot be empty'
        : (value.length < 8 ? "Mobile Number should be greater than 8" : null);
  }

  @action
  void validateAddress(String value) {
    error.address = value.isEmpty ? 'Address cannot be empty' : null;
  }

  @action
  void validateCountry(String value) {
    error.country = value.isEmpty ? 'Country cannot be empty' : null;
  }

  @action
  void validateCity(String value) {
    error.city = value.isEmpty ? 'City cannot be empty' : null;
  }

  @action
  void validatePostalCode(String value) {
    error.postalCode = value.isEmpty ? 'Postal code cannot be empty' : null;
  }

  @action
  void validateTerms(bool value) {
    error.acceptTerms = value == false ? 'Accept Terms and Conditions' : false;
  }

  @action
  void validateGender(bool value) {}

  @action
  void validateLocation(String value) {
    error.location = value.isEmpty ? 'Please select location' : null;
  }

  @action
  void validateCompany(String value) {
    error.company = value.isEmpty ? 'Please select company' : null;
  }

  @action
  void validateUserType(var value) {
    error.userLoginAs = value.isEmpty ? 'Please select userType' : null;
  }

  @action
  bool checkIfNameEmailPasswordMobileAreEmpty(
      String name, String email, String password, String mobileNumber) {
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        mobileNumber.isEmpty)
      return true;
    else
      return false;
  }

  bool validateFirstViewData() {
    return checkIfNameEmailPasswordMobileAreEmpty(
        name, email, password, mobileNumber);
  }

  @action
  bool checkIfCompanyAddressLocationTermsAreEmpty(
      address, location, acceptTerms, userLoginAs, company) {
    if (address.isEmpty || location.isEmpty || acceptTerms == false) {
      return true;
    }
    if (userLoginAs.index != 0) {
      if (company.isEmpty)
        return true;
      else
        return false;
    } else
      return false;
  }

  bool validateSecondViewData() {
    print("Result ::::: " +
        checkIfCompanyAddressLocationTermsAreEmpty(
                address, location, acceptTerms, userLoginAs, company)
            .toString());
    return checkIfCompanyAddressLocationTermsAreEmpty(
        address, location, acceptTerms, userLoginAs, company);
  }

  Future<Forgetpassword> verifyUserEmail(context) async {
    baseModel = await networkService.verifyEmail(verifyEmail, email, context);
    return baseModel;
  }

  Future<Forgetpassword> verifyMobileNumber(context) async {
    baseModel = await networkService.verifyUserMobileNumber(
        verifyMobileApi, mobileNumber, context);
    return baseModel;
  }

  Future<Forgetpassword> verifyUserName(context) async {
    baseModel =
        await networkService.verifyName(verifyUserNameApi, name, context);
    return baseModel;
  }

  Future<LocationContentModel> getBenchmarkLocation(context) async {
    return networkService.getBenchmarkLocation(getLocation, context);
  }

  Future<countryModel.CountryCodeModel> getCountryCodes(context) async {
    return networkService.getCountryCodes(getCountryCode, context);
  }

  @action
  Future<companiesModel.CompanyDialog> getCompanies(context) async {
    companyDialog = await networkService.getCompanies(getCompanyApi, context);
    return companyDialog;
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateName(name);
    validateEmail(email);
    validatePassword(password);
    validateNumber(mobileNumber);
    validateAddress(address);
    validateCountry(country);
    validateCity(city);
    validatePostalCode(postalCode);
    validateTerms(acceptTerms);
    validateCompany(company);
  }

//  Future<AuthModel> getTheUsers(context) async {
//    authModel =
//    await networkService.outhUser(outhUserApi, email, password, context);
//    return authModel;
//  }

}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String fullName = '';
  @observable
  String email = '';
  @observable
  String password;
  @observable
  String mobileNumber = '';
  @observable
  String address;
  @observable
  String country;
  @observable
  String city;
  @observable
  String postalCode;
  @observable
  bool acceptTerms;
  @observable
  String location;
  @observable
  String company;
  @observable
  String userLoginAs;
  @observable
  bool isMale;

  @computed
  bool get hasErrors => email != null || password != null;
}
