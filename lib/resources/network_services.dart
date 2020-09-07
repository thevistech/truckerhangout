import 'dart:convert';
import 'dart:io';
import 'package:flutterapp/models/area_unit_model.dart';
import 'package:flutterapp/models/auth_model.dart';
import 'package:flutterapp/models/brokers_dashboard.dart';
import 'package:flutterapp/models/chat_general_model.dart';
import 'package:flutterapp/models/chat_general_model.dart';
import 'package:flutterapp/models/comment_model.dart';
import 'package:flutterapp/models/country_code_model.dart';
import 'package:flutterapp/models/developers_model.dart';
import 'package:flutterapp/models/filter_property_model.dart';
import 'package:flutterapp/models/forget_password.dart';
import 'package:flutterapp/models/jobs_model.dart';
import 'package:flutterapp/models/lcoation_content_model.dart';
import 'package:flutterapp/models/company_model.dart';
import 'package:flutterapp/models/notification_model.dart';
import 'package:flutterapp/models/online_chat_users_model.dart';
import 'package:flutterapp/models/online_persons_chat_model.dart';
import 'package:flutterapp/models/post_model.dart';
import 'package:flutterapp/models/stories_model.dart';
import 'package:flutterapp/models/like_model.dart';
import 'package:flutterapp/models/advertisement_model.dart';
import 'package:flutterapp/models/follow_suggestion_model.dart';
import 'package:flutterapp/models/toggle_follow_unfollow.dart';
import 'package:flutterapp/models/user_profile_model.dart';
import 'package:flutterapp/models/users_calls_model.dart';
import 'package:flutterapp/utills/config.dart';
import 'package:flutterapp/utills/loaders/progress_dialog.dart';
import 'package:http/http.dart' as http;
import '../utills/config.dart';

class NetworkService {
  AuthModel authModel = new AuthModel();
  Forgetpassword forgetpassword = Forgetpassword();
  LocationContentModel locationContentModel = LocationContentModel();
  CountryCodeModel countryCodeModel = CountryCodeModel();
  CompanyDialog companyDialog = CompanyDialog();
  Brokers brokers = Brokers();
  AreaUnitModel areaUnit = AreaUnitModel();
  FilterPropertyModel filterPropertyModel = FilterPropertyModel();
  Notification notification = Notification();
  JobsModel jobsModel = JobsModel();
  PostModel postModel = PostModel();
  StoriesModel storiesModel = StoriesModel();
  Advertisements advertisementsModel = Advertisements();
  FollowSuggestion followSuggestionModel = FollowSuggestion();
  PostLikeAndCommentsModel postLikeAndCommentsModel =
      PostLikeAndCommentsModel();
  SavePostModel savePostModel = SavePostModel();
  ToggleFollowUnFollow toggleFollowUnFollow = ToggleFollowUnFollow();

  OnlinePersonsChat onlinePersonsChat = OnlinePersonsChat();
  OnlineUsersChat onlineUsersChat = OnlineUsersChat();

  ProfileModel profileModel = ProfileModel();
  UsersCalslModel usersCalslModel = UsersCalslModel();
  ChatGeneralModel chatGeneralModel = ChatGeneralModel();

  DeveloperModel developerModel = DeveloperModel();

// Informational responses (100–199),
// Successful responses (200–299),
// Redirects (300–399),
// Client errors (400–499),
// Server errors (500–599).

  checkIfInternetIsAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<AuthModel> outhUser(url, email, password, context) async {
    ProgressDialogDotted().showProgressDialog(context);

    var body = jsonEncode({});
    try {
      final response =
          await http.post(url + "$email&password=$password", body: body);
      final int statusCode = response.statusCode;
      print(statusCode);
      var decodedResponse = json.decode(response.body);
      ProgressDialogDotted().hideProgressDialog(context);
      if (statusCode >= 200 && statusCode <= 299) {
        return AuthModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        authModel.error = "true";
        authModel.error = decodedResponse['error'];
        authModel.messages = [decodedResponse['messages'][0]];
        return Future.value(authModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        authModel.error = "true";
        authModel.messages = ['Internal Server Error'];
        return Future.value(authModel);
      }
    } on Exception catch (e) {
      ProgressDialogDotted().hideProgressDialog(context);
      authModel.error = "true";
      if (e.toString().contains("SocketException"))
        authModel.messages = ['Internet Not Connected'];
      else
        authModel.messages = ['' + technicalErrorMessage];
      return Future.value(authModel);
    }
  }

  Future<Forgetpassword> forgetPassword(url, code, number, context) async {
    ProgressDialogDotted().showProgressDialog(context);

    print(url + "$code" + "$number");
    var body = jsonEncode({});
    try {
      // print(url + "app_id=$apiId&app_key=$apkey&country_code_id=$code&number=$number");
      final response = await http.post(
          url +
              "app_id=$appId&app_key=$appkey&country_code_id=$code&number=$number",
          body: body);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);

      ProgressDialogDotted().hideProgressDialog(context);
      if (statusCode >= 200 && statusCode <= 299) {
        return Forgetpassword.fromJson(json.decode(response.body));
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        forgetpassword.error = decodedResponse['error'];
        forgetpassword.message = decodedResponse['message'];
        return Future.value(forgetpassword);
      } else if (statusCode >= 500 && statusCode <= 599) {
        forgetpassword.error = "true";
        forgetpassword.message = "Internal Server Error";
        return Future.value(forgetpassword);
      }
    } on Exception catch (e) {
      ProgressDialogDotted().hideProgressDialog(context);
      forgetpassword.error = "true";
      if (e.toString().contains("SocketException"))
        forgetpassword.message = 'Internet Not Connected';
      else
        forgetpassword.message = '' + technicalErrorMessage;
      return Future.value(forgetpassword);
    }
  }

  Future<Forgetpassword> verifyCode(
      verifyCodeApi, mobileNumber, code, context) async {
    ProgressDialogDotted().showProgressDialog(context);

    var body = jsonEncode({});
    var url = verifyCodeApi +
        "app_id=$appId&app_key=$appkey&code=$code&number=$mobileNumber";
    print("$url");
    try {
      final response = await http.post(url, body: body);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);

      ProgressDialogDotted().hideProgressDialog(context);
      print("$decodedResponse");
      if (statusCode == 200 ||
          statusCode > 400 ||
          statusCode < 500 ||
          json == null) {
        forgetpassword.error = decodedResponse['error'];
        forgetpassword.message = decodedResponse['message'];
        return Future.value(forgetpassword);
      } else if (statusCode > 500) {
        forgetpassword.error = "true";
        forgetpassword.message = "Internal Server Error";
        return Future.value(forgetpassword);
      }
      return Forgetpassword.fromJson(json.decode(response.body));
    } on Exception catch (e) {
      ProgressDialogDotted().hideProgressDialog(context);
      forgetpassword.error = "true";
      if (e.toString().contains("SocketException"))
        forgetpassword.message = 'Internet Not Connected';
      else
        forgetpassword.message = '' + technicalErrorMessage;
      return Future.value(forgetpassword);
    }
  }

  Future<Forgetpassword> resetPassword(
      url, code, number, password, context) async {
    ProgressDialogDotted().showProgressDialog(context);

    var body = jsonEncode({});
    try {
      print(url +
          "app_id=$appId&app_key=$appkey&code=$code&number=$number&password=$password");
      final response = await http.post(
          url +
              "app_id=$appId&app_key=$appkey&code=$code&number=$number&password=$password",
          body: body);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);

      ProgressDialogDotted().hideProgressDialog(context);
      if (statusCode >= 200 && statusCode <= 299) {
        return Forgetpassword.fromJson(json.decode(response.body));
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        forgetpassword.error = decodedResponse['error'];
        forgetpassword.message = decodedResponse['message'];
        return Future.value(forgetpassword);
      } else if (statusCode >= 500 && statusCode <= 599) {
        forgetpassword.error = "true";
        forgetpassword.message = "Internal Server Error";
        return Future.value(forgetpassword);
      }
    } on Exception catch (e) {
      ProgressDialogDotted().hideProgressDialog(context);
      forgetpassword.error = "true";
      if (e.toString().contains("SocketException"))
        forgetpassword.message = 'Internet Not Connected';
      else
        forgetpassword.message = '' + technicalErrorMessage;
      return Future.value(forgetpassword);
    }
  }

  Future<LocationContentModel> getBenchmarkLocation(url, context) async {
    //  ProgressDialogDotted().showProgressDialog(context);
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print("$url \n $decodedResponse");
      //  ProgressDialogDotted().hideProgressDialog(context);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return LocationContentModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        locationContentModel.error = "true";
        locationContentModel.message = decodedResponse['messages'];
        return Future.value(locationContentModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        locationContentModel.error = "true";
        locationContentModel.message = 'Internal Server Error';
        return Future.value(locationContentModel);
      }
    } on Exception catch (e) {
      //  ProgressDialogDotted().hideProgressDialog(context);
      locationContentModel.error = "true";
      if (e.toString().contains("SocketException"))
        locationContentModel.message = 'Internet Not Connected';
      else
        locationContentModel.message = '' + technicalErrorMessage;
      return Future.value(locationContentModel);
    }
  }

  Future<CountryCodeModel> getCountryCodes(url, context) async {
    // ProgressDialogDotted().showProgressDialog(context);
    print("$url");
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print("$url \n $decodedResponse");
      // ProgressDialogDotted().hideProgressDialog(context);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return CountryCodeModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        countryCodeModel.error = "true";
        countryCodeModel.message = decodedResponse['messages'];
        return Future.value(countryCodeModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        countryCodeModel.error = "true";
        countryCodeModel.message = 'Internal Server Error';
        return Future.value(countryCodeModel);
      }
    } on Exception catch (e) {
      //ProgressDialogDotted().hideProgressDialog(context);
      countryCodeModel.error = "true";
      if (e.toString().contains("SocketException"))
        countryCodeModel.message = 'Internet Not Connected';
      else
        countryCodeModel.message = '' + technicalErrorMessage;
      return Future.value(countryCodeModel);
    }
  }

  Future<CompanyDialog> getCompanies(url, context) async {
    // ProgressDialogDotted().showProgressDialog(context);
    print("getCompanies :: $url");
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print("$url  \n $decodedResponse");
      // ProgressDialogDotted().hideProgressDialog(context);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return CompanyDialog.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        companyDialog.error = "true";
        companyDialog.message = decodedResponse['messages'];
        return Future.value(companyDialog);
      } else if (statusCode >= 500 && statusCode <= 599) {
        companyDialog.error = "true";
        companyDialog.message = 'Internal Server Error';
        return Future.value(companyDialog);
      }
    } on Exception catch (e) {
      //ProgressDialogDotted().hideProgressDialog(context);
      companyDialog.error = "true";
      if (e.toString().contains("SocketException"))
        companyDialog.message = 'Internet Not Connected';
      else
        companyDialog.message = '' + technicalErrorMessage;
      return Future.value(companyDialog);
    }
  }

  //get brokers list data

  Future<Brokers> getBrokersList(url, context) async {
    //  ProgressDialogDotted().showProgressDialog(context);
    print("$url");
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      // print("$url \n $decodedResponse");
      // ProgressDialogDotted().hideProgressDialog(context);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return Brokers.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        brokers.error = "true";
        brokers.message = decodedResponse['messages'];
        return Future.value(brokers);
      } else if (statusCode >= 500 && statusCode <= 599) {
        brokers.error = "true";
        brokers.message = 'Internal Server Error';
        return Future.value(brokers);
      }
    } on Exception catch (e) {
      // ProgressDialogDotted().hideProgressDialog(context);
      brokers.error = "true";
      if (e.toString().contains("SocketException"))
        brokers.message = 'Internet Not Connected';
      else
        brokers.message = '' + technicalErrorMessage;
      return Future.value(brokers);
    }
  }

  Future<Forgetpassword> verifyEmail(verifyEmail, email, context) async {
    // ProgressDialogDotted().showProgressDialog(context);
    var url = verifyEmail + "app_id=$appId&app_key=$appkey&email=$email";
    print("$url");
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);

      //ProgressDialogDotted().hideProgressDialog(context);
      print(decodedResponse);
      if (statusCode == 200 ||
          statusCode > 400 ||
          statusCode < 500 ||
          json == null) {
        print(response.statusCode);
        forgetpassword.error = decodedResponse['error'];
        print(forgetpassword.error);
        forgetpassword.message = decodedResponse['message'];
        print(forgetpassword.message);

        return Future.value(forgetpassword);
      } else if (statusCode > 500) {
        forgetpassword.error = "true";
        forgetpassword.message = "Internal Server Error";
        return Future.value(forgetpassword);
      }
      return Forgetpassword.fromJson(json.decode(response.body));
    } on Exception catch (e) {
      //  ProgressDialogDotted().hideProgressDialog(context);
      forgetpassword.error = "true";
      if (e.toString().contains("SocketException"))
        forgetpassword.message = 'Internet Not Connected';
      else
        forgetpassword.message = '' + technicalErrorMessage;
      return Future.value(forgetpassword);
    }
  }

  Future<Forgetpassword> verifyUserMobileNumber(
      verifyEmail, number, context) async {
    //  ProgressDialogDotted().showProgressDialog(context);

    //  var body = jsonEncode({});
    var url = verifyEmail + "app_id=$appId&app_key=$appkey&number=$number";
    print("$url");
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      // ProgressDialogDotted().hideProgressDialog(context);
      if (statusCode >= 200 && statusCode <= 299) {
        return Forgetpassword.fromJson(json.decode(response.body));
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        forgetpassword.error = decodedResponse['error'];
        forgetpassword.message = decodedResponse['message'];
        return Future.value(forgetpassword);
      } else if (statusCode >= 500 && statusCode <= 599) {
        forgetpassword.error = "true";
        forgetpassword.message = "Internal Server Error";
        return Future.value(forgetpassword);
      }
    } on Exception catch (e) {
      // ProgressDialogDotted().hideProgressDialog(context);
      forgetpassword.error = "true";
      if (e.toString().contains("SocketException"))
        forgetpassword.message = 'Internet Not Connected';
      else
        forgetpassword.message = '' + technicalErrorMessage;
      return Future.value(forgetpassword);
    }
  }

  Future<Forgetpassword> verifyName(verifyEmail, name, context) async {
    // ProgressDialogDotted().showProgressDialog(context);

    //  var body = jsonEncode({});
    var url = verifyEmail + "app_id=$appId&app_key=$appkey&username=$name";
    print("$url");
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);

      // ProgressDialogDotted().hideProgressDialog(context);
      print(decodedResponse);
      if (statusCode == 200 ||
          statusCode > 400 ||
          statusCode < 500 ||
          json == null) {
        print(response.statusCode);
        forgetpassword.error = decodedResponse['error'];
        print(forgetpassword.error);
        forgetpassword.message = decodedResponse['message'];
        print(forgetpassword.message);

        return Future.value(forgetpassword);
      } else if (statusCode > 500) {
        forgetpassword.error = "true";
        forgetpassword.message = "Internal Server Error";
        return Future.value(forgetpassword);
      }
      return Forgetpassword.fromJson(json.decode(response.body));
    } on Exception catch (e) {
      // ProgressDialogDotted().hideProgressDialog(context);
      forgetpassword.error = "true";
      if (e.toString().contains("SocketException"))
        forgetpassword.message = 'Internet Not Connected';
      else
        forgetpassword.message = '' + technicalErrorMessage;
      return Future.value(forgetpassword);
    }
  }

  //get area units

  Future<AreaUnitModel> getAreaUnit(url, context) async {
    ProgressDialogDotted().showProgressDialog(context);
    print("$url");
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      ProgressDialogDotted().hideProgressDialog(context);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return AreaUnitModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        areaUnit.error = "true";
        areaUnit.message = decodedResponse['messages'];
        return Future.value(areaUnit);
      } else if (statusCode >= 500 && statusCode <= 599) {
        areaUnit.error = "true";
        areaUnit.message = 'Internal Server Error';
        return Future.value(areaUnit);
      }
    } on Exception catch (e) {
      ProgressDialogDotted().hideProgressDialog(context);
      areaUnit.error = "true";
      if (e.toString().contains("SocketException"))
        areaUnit.message = 'Internet Not Connected';
      else
        areaUnit.message = '' + technicalErrorMessage;
      return Future.value(areaUnit);
    }
  }

  //get filter data
  Future<FilterPropertyModel> getFilters(url, context) async {
    // ProgressDialogDotted().showProgressDialog(context);
    var userID = await Config.getUserID();
    url = url + "&session_user_id=" + userID;
    print("get filter url ::: $url");

    try {

      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      // ProgressDialogDotted().hideProgressDialog(context);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return FilterPropertyModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        filterPropertyModel.error = "true";
        filterPropertyModel.message = decodedResponse['messages'];
        return Future.value(filterPropertyModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        filterPropertyModel.error = "true";
        filterPropertyModel.message = 'Internal Server Error';
        return Future.value(filterPropertyModel);
      }
    } on Exception catch (e) {
      //ProgressDialogDotted().hideProgressDialog(context);
      filterPropertyModel.error = "true";
      if (e.toString().contains("SocketException"))
        filterPropertyModel.message = 'Internet Not Connected';
      else
        filterPropertyModel.message = '' + technicalErrorMessage;
      return Future.value(filterPropertyModel);
    }
  }

  //get Notification data
  Future<Notification> getNotificationData(url, context, pageNumber) async {
    // ProgressDialogDotted().showProgressDialog(context);
    var userID = await Config.getUserID();
    try {
      final response =
          await http.get(url + userID + "&page=" + pageNumber.toString());
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      //  ProgressDialogDotted().hideProgressDialog(context);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return Notification.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        notification.error = "true";
        notification.message = decodedResponse['messages'];
        return Future.value(notification);
      } else if (statusCode >= 500 && statusCode <= 599) {
        notification.error = "true";
        notification.message = 'Internal Server Error';
        return Future.value(notification);
      }
    } on Exception catch (e) {
      // ProgressDialogDotted().hideProgressDialog(context);
      notification.error = "true";
      if (e.toString().contains("SocketException"))
        notification.message = 'Internet Not Connected';
      else
        notification.message = '' + technicalErrorMessage;
      return Future.value(notification);
    }
  }

  //get jobs data
  Future<JobsModel> getJobData(url, context, pageno) async {
    var userID = await Config.getUserID();
    try {
      var jobsUrl = url + '&page=$pageno&candidate_id';
      print(jobsUrl);
      final response = await http.get(jobsUrl);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      if (statusCode >= 200 && statusCode <= 299) {
        return JobsModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        jobsModel.error = "true";
        jobsModel.message = decodedResponse['messages'];
        return Future.value(jobsModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        jobsModel.error = "true";
        jobsModel.message = 'Internal Server Error';
        return Future.value(jobsModel);
      }
    } on Exception catch (e) {
      jobsModel.error = "true";
      if (e.toString().contains("SocketException"))
        jobsModel.message = 'Internet Not Connected';
      else
        jobsModel.message = '' + technicalErrorMessage;
      return Future.value(jobsModel);
    }
  }

  //get jobs data
  Future<PostModel> getProperties(url, context) async {
    var userID = await Config.getUserID();
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      if (statusCode >= 200 && statusCode <= 299) {
        return PostModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        postModel.error = "true";
        postModel.message = decodedResponse['messages'];
        return Future.value(postModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        postModel.error = "true";
        postModel.message = 'Internal Server Error';
        return Future.value(postModel);
      }
    } on Exception catch (e) {
      postModel.error = "true";
      if (e.toString().contains("SocketException"))
        postModel.message = 'Internet Not Connected';
      else
        postModel.message = '' + technicalErrorMessage;
      return Future.value(postModel);
    }
  }

  //get jobs data
  Future<StoriesModel> getStories(url, context) async {
    var userID = await Config.getUserID();
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return StoriesModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        storiesModel.error = "true";
        storiesModel.message = decodedResponse['messages'];
        return Future.value(storiesModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        storiesModel.error = "true";
        storiesModel.message = 'Internal Server Error';
        return Future.value(storiesModel);
      }
    } on Exception catch (e) {
      storiesModel.error = "true";
      if (e.toString().contains("SocketException"))
        storiesModel.message = 'Internet Not Connected';
      else
        storiesModel.message = '' + technicalErrorMessage;
      return Future.value(storiesModel);
    }
  }

  //get jobs data
  // ignore: missing_return
  Future<Advertisements> getAdvertisement(url, context, type) async {
    url = url + type;
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return Advertisements.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        advertisementsModel.error = "true";
        advertisementsModel.message = decodedResponse['messages'];
        return Future.value(advertisementsModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        advertisementsModel.error = "true";
        advertisementsModel.message = 'Internal Server Error';
        return Future.value(advertisementsModel);
      }
    } on Exception catch (e) {
      advertisementsModel.error = "true";
      if (e.toString().contains("SocketException"))
        advertisementsModel.message = 'Internet Not Connected';
      else
        advertisementsModel.message = '' + technicalErrorMessage;
      return Future.value(advertisementsModel);
    }
  }

  // ignore: missing_return
  Future<FollowSuggestion> getFollowSuggestions(url, context, type) async {
    var userID = await Config.getUserID();
    url = url + "session_user_id=" + userID + "&followed_type=" + type;
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return FollowSuggestion.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        followSuggestionModel.error = "true";
        followSuggestionModel.message = decodedResponse['messages'];
        return Future.value(followSuggestionModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        followSuggestionModel.error = "true";
        followSuggestionModel.message = 'Internal Server Error';
        return Future.value(followSuggestionModel);
      }
    } on Exception catch (e) {
      followSuggestionModel.error = "true";
      if (e.toString().contains("SocketException"))
        followSuggestionModel.message = 'Internet Not Connected';
      else
        followSuggestionModel.message = '' + technicalErrorMessage;
      return Future.value(followSuggestionModel);
    }
  }

  // ignore: missing_return
  Future<PostLikeAndCommentsModel> likeOnPost(
      url, context, type, postID) async {
    var userID = await Config.getUserID();
    var companyID = await Config.getCompanyID();
    url = url +
        "id=$postID&type=$type&session_comp_id=$companyID&session_user_id=$userID";
    print("POST URL " + url);
    try {
      final response = await http.post(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return PostLikeAndCommentsModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        postLikeAndCommentsModel.error = "true";
        postLikeAndCommentsModel.message = decodedResponse['messages'];
        return Future.value(postLikeAndCommentsModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        postLikeAndCommentsModel.error = "true";
        postLikeAndCommentsModel.message = 'Internal Server Error';
        return Future.value(postLikeAndCommentsModel);
      }
    } on Exception catch (e) {
      postLikeAndCommentsModel.error = "true";
      if (e.toString().contains("SocketException"))
        postLikeAndCommentsModel.message = 'Internet Not Connected';
      else
        postLikeAndCommentsModel.message = '' + technicalErrorMessage;
      return Future.value(postLikeAndCommentsModel);
    }
  }

  // ignore: missing_return
  Future<PostLikeAndCommentsModel> getlikeForPost(
      url, context, type, postID) async {
    url = url + "reference_id=$postID&reference_type=$type";
    print("URL getlikeForPost" + url);
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return PostLikeAndCommentsModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        postLikeAndCommentsModel.error = "true";
        postLikeAndCommentsModel.message = decodedResponse['messages'];
        return Future.value(postLikeAndCommentsModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        postLikeAndCommentsModel.error = "true";
        postLikeAndCommentsModel.message = 'Internal Server Error';
        return Future.value(postLikeAndCommentsModel);
      }
    } on Exception catch (e) {
      postLikeAndCommentsModel.error = "true";
      if (e.toString().contains("SocketException"))
        postLikeAndCommentsModel.message = 'Internet Not Connected';
      else
        postLikeAndCommentsModel.message = '' + technicalErrorMessage;
      return Future.value(postLikeAndCommentsModel);
    }
  }

  // ignore: missing_return
  Future<PostLikeAndCommentsModel> getCommentsForPost(
      url, context, type, postID) async {
    url = url + "reference_id=$postID&reference_type=$type";
    print("URL getCommentsForPost" + url);
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return PostLikeAndCommentsModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        postLikeAndCommentsModel.error = "true";
        postLikeAndCommentsModel.message = decodedResponse['messages'];
        return Future.value(postLikeAndCommentsModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        postLikeAndCommentsModel.error = "true";
        postLikeAndCommentsModel.message = 'Internal Server Error';
        return Future.value(postLikeAndCommentsModel);
      }
    } on Exception catch (e) {
      postLikeAndCommentsModel.error = "true";
      if (e.toString().contains("SocketException"))
        postLikeAndCommentsModel.message = 'Internet Not Connected';
      else
        postLikeAndCommentsModel.message = '' + technicalErrorMessage;
      return Future.value(postLikeAndCommentsModel);
    }
  }

// ignore: missing_return
  Future<PostLikeAndCommentsModel> postCommentsForPost(
      url, context, type, postID, commentText) async {
    var userID = await Config.getUserID();
    var companyID = await Config.getCompanyID();
    url = url +
        "reference_id=$postID&reference_type=$type&session_comp_id=$companyID&session_user_id=$userID&comment=$commentText";
    print("URL postCommentsForPost" + url);
    try {
      final response = await http.post(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return PostLikeAndCommentsModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        postLikeAndCommentsModel.error = "true";
        postLikeAndCommentsModel.message = decodedResponse['messages'];
        return Future.value(postLikeAndCommentsModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        postLikeAndCommentsModel.error = "true";
        postLikeAndCommentsModel.message = 'Internal Server Error';
        return Future.value(postLikeAndCommentsModel);
      }
    } on Exception catch (e) {
      postLikeAndCommentsModel.error = "true";
      if (e.toString().contains("SocketException"))
        postLikeAndCommentsModel.message = 'Internet Not Connected';
      else
        postLikeAndCommentsModel.message = '' + technicalErrorMessage;
      return Future.value(postLikeAndCommentsModel);
    }
  }

// ignore: missing_return
  Future<PostLikeAndCommentsModel> deleteCommentsFromPost(
      url, context, type, postID, refID) async {
    var userID = await Config.getUserID();
    var companyID = await Config.getCompanyID();
    url = url +
        "id=$postID&reference_id=$refID&reference_type=$type&session_comp_id=$companyID&session_user_id=$userID";
    print("URL deleteCommentFromPost" + url);
    try {
      final response = await http.delete(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return PostLikeAndCommentsModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        postLikeAndCommentsModel.error = "true";
        postLikeAndCommentsModel.message = decodedResponse['messages'];
        return Future.value(postLikeAndCommentsModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        postLikeAndCommentsModel.error = "true";
        postLikeAndCommentsModel.message = 'Internal Server Error';
        return Future.value(postLikeAndCommentsModel);
      }
    } on Exception catch (e) {
      postLikeAndCommentsModel.error = "true";
      if (e.toString().contains("SocketException"))
        postLikeAndCommentsModel.message = 'Internet Not Connected';
      else
        postLikeAndCommentsModel.message = '' + technicalErrorMessage;
      return Future.value(postLikeAndCommentsModel);
    }
  }

// ignore: missing_return
  Future<PostLikeAndCommentsModel> updateCommentsFromPost(
      url, context, type, postID, refID, text) async {
    var userID = await Config.getUserID();
    var companyID = await Config.getCompanyID();
    url = url +
        "id=$postID&reference_id=$refID&reference_type=$type&session_comp_id=$companyID&session_user_id=$userID&comment=$text";
    print("URL deleteCommentFromPost" + url);
    try {
      final response = await http.put(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return PostLikeAndCommentsModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        postLikeAndCommentsModel.error = "true";
        postLikeAndCommentsModel.message = decodedResponse['messages'];
        return Future.value(postLikeAndCommentsModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        postLikeAndCommentsModel.error = "true";
        postLikeAndCommentsModel.message = 'Internal Server Error';
        return Future.value(postLikeAndCommentsModel);
      }
    } on Exception catch (e) {
      postLikeAndCommentsModel.error = "true";
      if (e.toString().contains("SocketException"))
        postLikeAndCommentsModel.message = 'Internet Not Connected';
      else
        postLikeAndCommentsModel.message = '' + technicalErrorMessage;
      return Future.value(postLikeAndCommentsModel);
    }
  }

  // ignore: missing_return
  Future<SavePostModel> savePost(url, context, type, postID) async {
    var userID = await Config.getUserID();
    var companyID = await Config.getCompanyID();
    url = url +
        "id=$postID&type=$type&session_comp_id=$companyID&session_user_id=$userID";
    print("URL savePost" + url);
    try {
      final response = await http.post(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return SavePostModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        savePostModel.error = "true";
        savePostModel.message = decodedResponse['messages'];
        return Future.value(savePostModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        savePostModel.error = "true";
        savePostModel.message = 'Internal Server Error';
        return Future.value(savePostModel);
      }
    } on Exception catch (e) {
      savePostModel.error = "true";
      if (e.toString().contains("SocketException"))
        savePostModel.message = 'Internet Not Connected';
      else
        savePostModel.message = '' + technicalErrorMessage;
      return Future.value(savePostModel);
    }
  }

  // ignore: missing_return
  Future<ToggleFollowUnFollow> toggleFollowUnFollowUser(
      url, context, followID) async {
    var userID = await Config.getUserID();
    var companyID = await Config.getCompanyID();
    url = url +
        "followed_to_id=$followID&followed_type=UserToUser&session_comp_id=$companyID&session_user_id=$userID";
    print("URL toggleFollowUnFollow" + url);
    try {
      final response = await http.post(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return ToggleFollowUnFollow.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        toggleFollowUnFollow.error = "true";
        toggleFollowUnFollow.message = decodedResponse['messages'];
        return Future.value(toggleFollowUnFollow);
      } else if (statusCode >= 500 && statusCode <= 599) {
        toggleFollowUnFollow.error = "true";
        toggleFollowUnFollow.message = 'Internal Server Error';
        return Future.value(toggleFollowUnFollow);
      }
    } on Exception catch (e) {
      toggleFollowUnFollow.error = "true";
      if (e.toString().contains("SocketException"))
        savePostModel.message = 'Internet Not Connected';
      else
        toggleFollowUnFollow.message = '' + technicalErrorMessage;
      return Future.value(toggleFollowUnFollow);
    }
  }

  //get chat gernal api
  Future<ChatGeneralModel> chatGernalDataApi(
      url, context, int pageNumber) async {
    var userID = await Config.getUserID();

    url = url + "&session_user_id=$userID";
    print("URL for gernal chat" + url);

    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        print('true');
        return ChatGeneralModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        chatGeneralModel.error = "true";
        chatGeneralModel.message = decodedResponse['messages'];
        return Future.value(chatGeneralModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        chatGeneralModel.error = "true";
        chatGeneralModel.message = 'Internal Server Error';
        return Future.value(chatGeneralModel);
      }
    } on Exception catch (e) {
      chatGeneralModel.error = "true";
      if (e.toString().contains("SocketException"))
        chatGeneralModel.message = 'Internet Not Connected';
      else
        chatGeneralModel.message = '' + technicalErrorMessage;
      return Future.value(chatGeneralModel);
    }
  }

  //show conversion api on chat main screen
  Future<OnlinePersonsChat> onlinePersonsForChat(
      url, context, int pageNumber) async {
    print("URL chat online " + url);
    try {
      final response = await http.get(url + "&page=" + pageNumber.toString());
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        print('true');
        return OnlinePersonsChat.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        onlinePersonsChat.error = "true";
        onlinePersonsChat.message = decodedResponse['messages'];
        return Future.value(onlinePersonsChat);
      } else if (statusCode >= 500 && statusCode <= 599) {
        onlinePersonsChat.error = "true";
        onlinePersonsChat.message = 'Internal Server Error';
        return Future.value(onlinePersonsChat);
      }
    } on Exception catch (e) {
      onlinePersonsChat.error = "true";
      if (e.toString().contains("SocketException"))
        onlinePersonsChat.message = 'Internet Not Connected';
      else
        onlinePersonsChat.message = '' + technicalErrorMessage;
      return Future.value(onlinePersonsChat);
    }
  }

  //show online users
  Future<OnlineUsersChat> onlineUsersForChat(url, context) async {
    var userID = await Config.getUserID();
    url = url + "session_user_id=1";
    print("chat online " + url);
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        print('true');
        return OnlineUsersChat.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        onlineUsersChat.error = "true";
        onlineUsersChat.message = decodedResponse['messages'];
        return Future.value(onlineUsersChat);
      } else if (statusCode >= 500 && statusCode <= 599) {
        onlineUsersChat.error = "true";
        onlineUsersChat.message = 'Internal Server Error';
        return Future.value(onlineUsersChat);
      }
    } on Exception catch (e) {
      onlineUsersChat.error = "true";
      if (e.toString().contains("SocketException"))
        onlineUsersChat.message = 'Internet Not Connected';
      else
        onlineUsersChat.message = '' + technicalErrorMessage;
      return Future.value(onlineUsersChat);
    }
  }

  //show  users profile data
  Future<ProfileModel> getUsersProfile(url, context, id) async {
    var userID = await Config.getUserID();
    url = url + "id=$id";
    print("chat online " + url);
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        print('true');
        return ProfileModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        profileModel.error = "true";
        profileModel.message = decodedResponse['messages'];
        return Future.value(profileModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        profileModel.error = "true";
        profileModel.message = 'Internal Server Error';
        return Future.value(profileModel);
      }
    } on Exception catch (e) {
      profileModel.error = "true";
      if (e.toString().contains("SocketException"))
        profileModel.message = 'Internet Not Connected';
      else
        profileModel.message = '' + technicalErrorMessage;
      return Future.value(profileModel);
    }
  }

  //get user calls

//show online users
  Future<UsersCalslModel> getUserCallsData(url, context) async {
    var userID = await Config.getUserID();
    url = url + 'session_user_id=$userID';
    print("calls url " + url);
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        print('true');
        return UsersCalslModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        usersCalslModel.error = "true";
        usersCalslModel.message = decodedResponse['messages'];
        return Future.value(usersCalslModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        usersCalslModel.error = "true";
        usersCalslModel.message = 'Internal Server Error';
        return Future.value(usersCalslModel);
      }
    } on Exception catch (e) {
      usersCalslModel.error = "true";
      if (e.toString().contains("SocketException"))
        usersCalslModel.message = 'Internet Not Connected';
      else
        usersCalslModel.message = '' + technicalErrorMessage;
      return Future.value(usersCalslModel);
    }
  }

  //get Notification data
  Future<DeveloperModel> getDeveloperData(
      url, context, pageNumber, search) async {
    // ProgressDialogDotted().showProgressDialog(context);
    try {
      final response = await http
          .get(url + "page=" + pageNumber.toString() + "&title" + search);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      //  ProgressDialogDotted().hideProgressDialog(context);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return DeveloperModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        developerModel.error = "true";
        developerModel.message = decodedResponse['messages'];
        return Future.value(developerModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        developerModel.error = "true";
        developerModel.message = 'Internal Server Error';
        return Future.value(developerModel);
      }
    } on Exception catch (e) {
      // ProgressDialogDotted().hideProgressDialog(context);
      developerModel.error = "true";
      if (e.toString().contains("SocketException"))
        developerModel.message = 'Internet Not Connected';
      else
        developerModel.message = '' + technicalErrorMessage;
      return Future.value(developerModel);
    }
  }
}
