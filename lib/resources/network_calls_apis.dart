import '../utills/config.dart';

const String BaseUrl = 'https://truckerhangout.com/public/api/public/';
const String BaseUrlForLogin = 'https://truckerhangout.com/public/api/';
/* Login Api */
final String outhUserApi = BaseUrlForLogin + 'oauth/token?email=';
/* Forgot Pass Send Code Api */
final String forgetPassApi = BaseUrl + 'password/forgot/send-code?';
/* Validate Code Api */
final String verifyCodeApi = BaseUrl + 'password/forgot/validate-code?';
/* Reset Passeord Api */
final String resetPasswordApi = BaseUrl + 'password/forgot/reset?';
/* Get Location Api */
final String getLocation = BaseUrl + 'locations/list?$appIDAndAppKey';
/* Get Country & Code Api */
final String getCountryCode = BaseUrl + 'country-code/list?$appIDAndAppKey';
/* Get Companies Api */
final String getCompanyApi = BaseUrl + 'sign-up/companies?$appIDAndAppKey';
/* Verify Email APi  */
final String verifyEmail = BaseUrl + 'sign-up/email?';
/* Verify Mobile Number Api */
final String verifyMobileApi = BaseUrl + 'sign-up/number?';
/* Verify User Name Api */
final String verifyUserNameApi = BaseUrl + 'sign-up/username?';
/* Get List Of Brokers */
final String brokersApi = BaseUrl + 'brokers/list?$appIDAndAppKey';
/* Get Units */
final String areaUnitApi = BaseUrl + 'units/list?$appIDAndAppKey';
/* Get Filters Components */
final String filtersApi = BaseUrl + 'general/property/filter?$appIDAndAppKey';
/* List Of Notification */
final String notificationApi =
    BaseUrl + 'notifications/list?$appIDAndAppKey&id&notification_for_user_id=';
/* Get List Of Jobs */
final String jobsApiUrl = BaseUrl + 'general/jobs?$appIDAndAppKey';
/* Get List Of Properties */
final String propertiesApi = BaseUrl + 'general/properties?$appIDAndAppKey';
/* Get List Of Projects */
final String projectsApi =
    BaseUrl + 'general/properties?$appIDAndAppKey&purpose=off-plan';
/* Get List Of Stories */
final String storiesApi =
    BaseUrl + 'stories/list?$appIDAndAppKey&id&created_by_user_id#';
/* Get List Of Advertisment */
final String advertisementApi =
    BaseUrl + "advertisements/list?$appIDAndAppKey&type=";
/* Get List Of Followers Suggestion */
final String followSuggestion =
    BaseUrl + "to-be-following/list?$appIDAndAppKey&";
/* Post Api Like The Post */
final String likeThePostApi = BaseUrl + "like?$appIDAndAppKey&";
/* Post Api Comment On The Post */
//todo Change the comment URL
final String commentOnThePostApi = BaseUrl + "comment/create?$appIDAndAppKey&";
/* Post Api Save The Post */
final String saveThePostApi = BaseUrl + "save?$appIDAndAppKey&";
/* Get All the likes for Post */
final String getAllLikesForThePost = BaseUrl + "likes/list?$appIDAndAppKey&";
final String getAllCommentsForThePost =
    BaseUrl + "comments/list?$appIDAndAppKey&";
final String deleteCommentsApi = BaseUrl + "comment/delete?$appIDAndAppKey&";
final String updateCommentsApi = BaseUrl + "comment/update?$appIDAndAppKey&";
final String postFollowUnFollow = BaseUrl + "follower/toggle?$appIDAndAppKey&";
/* Chats api to get messages */

final String onlineChatsPersons = BaseUrl + "messengers/list?$appIDAndAppKey";


//gernal chat api
final String gernalChat = BaseUrl + "general/messengers?$appIDAndAppKey";


/* Chats api to get online users */

final String onlineUsersForChats = BaseUrl + "users/list?$appIDAndAppKey&";
/* users profile */

final String usersProfile = BaseUrl + "users/list?$appIDAndAppKey&";

final String usersCallsApi = BaseUrl + "call-logs/list?$appIDAndAppKey&";
final String getAllDevelopers = BaseUrl + "developers/list?$appIDAndAppKey&";
