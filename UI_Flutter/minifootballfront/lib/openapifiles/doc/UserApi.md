# openapi.api.UserApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiUserAddressByJwtGet**](UserApi.md#apiuseraddressbyjwtget) | **GET** /api/User/address-by-jwt | 
[**apiUserAdminsGet**](UserApi.md#apiuseradminsget) | **GET** /api/User/admins | 
[**apiUserAllGet**](UserApi.md#apiuserallget) | **GET** /api/User/all | 
[**apiUserBanPlayerPut**](UserApi.md#apiuserbanplayerput) | **PUT** /api/User/ban-player | 
[**apiUserBannedUsersGet**](UserApi.md#apiuserbannedusersget) | **GET** /api/User/banned-users | 
[**apiUserByCityIdGet**](UserApi.md#apiuserbycityidget) | **GET** /api/User/by-city-id | 
[**apiUserByDetailsIdGet**](UserApi.md#apiuserbydetailsidget) | **GET** /api/User/by-details-id | 
[**apiUserByEmailGet**](UserApi.md#apiuserbyemailget) | **GET** /api/User/by-email | 
[**apiUserByJwtGet**](UserApi.md#apiuserbyjwtget) | **GET** /api/User/by-jwt | 
[**apiUserByMatchGet**](UserApi.md#apiuserbymatchget) | **GET** /api/User/by-match | 
[**apiUserByUsernameGet**](UserApi.md#apiuserbyusernameget) | **GET** /api/User/by-username | 
[**apiUserDeleteUserDelete**](UserApi.md#apiuserdeleteuserdelete) | **DELETE** /api/User/delete-user | 
[**apiUserDetailsByJwtGet**](UserApi.md#apiuserdetailsbyjwtget) | **GET** /api/User/details-by-jwt | 
[**apiUserRemoveAdminPut**](UserApi.md#apiuserremoveadminput) | **PUT** /api/User/remove-admin | 
[**apiUserSearchGet**](UserApi.md#apiusersearchget) | **GET** /api/User/search | 
[**apiUserSetAdminPut**](UserApi.md#apiusersetadminput) | **PUT** /api/User/set-admin | 
[**apiUserUnbanPlayerPut**](UserApi.md#apiuserunbanplayerput) | **PUT** /api/User/unban-player | 
[**apiUserUpdateAddressPut**](UserApi.md#apiuserupdateaddressput) | **PUT** /api/User/update-address | 
[**apiUserUpdateBirthdatePut**](UserApi.md#apiuserupdatebirthdateput) | **PUT** /api/User/update-birthdate | 
[**apiUserUpdateEmailPut**](UserApi.md#apiuserupdateemailput) | **PUT** /api/User/update-email | 
[**apiUserUpdatePasswordPut**](UserApi.md#apiuserupdatepasswordput) | **PUT** /api/User/update-password | 
[**apiUserUpdatePhoneNumberPut**](UserApi.md#apiuserupdatephonenumberput) | **PUT** /api/User/update-phone-number | 
[**apiUserUpdateUserPut**](UserApi.md#apiuserupdateuserput) | **PUT** /api/User/update-user | 
[**apiUserUpdateUsernamePut**](UserApi.md#apiuserupdateusernameput) | **PUT** /api/User/update-username | 
[**apiUserUserByIdGet**](UserApi.md#apiuseruserbyidget) | **GET** /api/User/user-by-id | 
[**apiUserUsersPaginatedGet**](UserApi.md#apiuseruserspaginatedget) | **GET** /api/User/users-paginated | 


# **apiUserAddressByJwtGet**
> AddressDTO apiUserAddressByJwtGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();

try {
    final result = api_instance.apiUserAddressByJwtGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserAddressByJwtGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AddressDTO**](AddressDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserAdminsGet**
> List<UserEntityDTO> apiUserAdminsGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();

try {
    final result = api_instance.apiUserAdminsGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserAdminsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<UserEntityDTO>**](UserEntityDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserAllGet**
> List<UserEntityDTO> apiUserAllGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();

try {
    final result = api_instance.apiUserAllGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserAllGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<UserEntityDTO>**](UserEntityDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserBanPlayerPut**
> apiUserBanPlayerPut(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final id = 56; // int | 

try {
    api_instance.apiUserBanPlayerPut(id);
} catch (e) {
    print('Exception when calling UserApi->apiUserBanPlayerPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserBannedUsersGet**
> List<UserEntityDTO> apiUserBannedUsersGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();

try {
    final result = api_instance.apiUserBannedUsersGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserBannedUsersGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<UserEntityDTO>**](UserEntityDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserByCityIdGet**
> List<UserEntityDTO> apiUserByCityIdGet(cityId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final cityId = 56; // int | 

try {
    final result = api_instance.apiUserByCityIdGet(cityId);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserByCityIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **int**|  | [optional] 

### Return type

[**List<UserEntityDTO>**](UserEntityDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserByDetailsIdGet**
> UserDetailsDTO apiUserByDetailsIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final id = 56; // int | 

try {
    final result = api_instance.apiUserByDetailsIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserByDetailsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

[**UserDetailsDTO**](UserDetailsDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserByEmailGet**
> UserEntityDTO apiUserByEmailGet(email)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final email = email_example; // String | 

try {
    final result = api_instance.apiUserByEmailGet(email);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserByEmailGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | [optional] 

### Return type

[**UserEntityDTO**](UserEntityDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserByJwtGet**
> UserEntityDTO apiUserByJwtGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();

try {
    final result = api_instance.apiUserByJwtGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserByJwtGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserEntityDTO**](UserEntityDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserByMatchGet**
> List<UserEntityDTO> apiUserByMatchGet(matchId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final matchId = 56; // int | 

try {
    final result = api_instance.apiUserByMatchGet(matchId);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserByMatchGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**|  | [optional] 

### Return type

[**List<UserEntityDTO>**](UserEntityDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserByUsernameGet**
> UserEntityDTO apiUserByUsernameGet(username)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final username = username_example; // String | 

try {
    final result = api_instance.apiUserByUsernameGet(username);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserByUsernameGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**|  | [optional] 

### Return type

[**UserEntityDTO**](UserEntityDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserDeleteUserDelete**
> apiUserDeleteUserDelete(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final id = 56; // int | 

try {
    api_instance.apiUserDeleteUserDelete(id);
} catch (e) {
    print('Exception when calling UserApi->apiUserDeleteUserDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserDetailsByJwtGet**
> UserDetailsDTO apiUserDetailsByJwtGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();

try {
    final result = api_instance.apiUserDetailsByJwtGet();
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserDetailsByJwtGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserDetailsDTO**](UserDetailsDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserRemoveAdminPut**
> apiUserRemoveAdminPut(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final id = 56; // int | 

try {
    api_instance.apiUserRemoveAdminPut(id);
} catch (e) {
    print('Exception when calling UserApi->apiUserRemoveAdminPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserSearchGet**
> UserEntityDTOPaginatedResponse apiUserSearchGet(currentPage, pageSize, str)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final currentPage = 56; // int | 
final pageSize = 56; // int | 
final str = str_example; // String | 

try {
    final result = api_instance.apiUserSearchGet(currentPage, pageSize, str);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserSearchGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **currentPage** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 
 **str** | **String**|  | [optional] 

### Return type

[**UserEntityDTOPaginatedResponse**](UserEntityDTOPaginatedResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserSetAdminPut**
> apiUserSetAdminPut(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final id = 56; // int | 

try {
    api_instance.apiUserSetAdminPut(id);
} catch (e) {
    print('Exception when calling UserApi->apiUserSetAdminPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserUnbanPlayerPut**
> apiUserUnbanPlayerPut(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final id = 56; // int | 

try {
    api_instance.apiUserUnbanPlayerPut(id);
} catch (e) {
    print('Exception when calling UserApi->apiUserUnbanPlayerPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserUpdateAddressPut**
> UserEntityDTOUpdateRequestResponse apiUserUpdateAddressPut(cityId, streetAndNo)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final cityId = 56; // int | 
final streetAndNo = streetAndNo_example; // String | 

try {
    final result = api_instance.apiUserUpdateAddressPut(cityId, streetAndNo);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserUpdateAddressPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **int**|  | [optional] 
 **streetAndNo** | **String**|  | [optional] 

### Return type

[**UserEntityDTOUpdateRequestResponse**](UserEntityDTOUpdateRequestResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserUpdateBirthdatePut**
> UserEntityDTOUpdateRequestResponse apiUserUpdateBirthdatePut(day, month, year)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final day = 56; // int | 
final month = 56; // int | 
final year = 56; // int | 

try {
    final result = api_instance.apiUserUpdateBirthdatePut(day, month, year);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserUpdateBirthdatePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **day** | **int**|  | [optional] 
 **month** | **int**|  | [optional] 
 **year** | **int**|  | [optional] 

### Return type

[**UserEntityDTOUpdateRequestResponse**](UserEntityDTOUpdateRequestResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserUpdateEmailPut**
> UserEntityDTOUpdateRequestResponse apiUserUpdateEmailPut(email)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final email = email_example; // String | 

try {
    final result = api_instance.apiUserUpdateEmailPut(email);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserUpdateEmailPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | [optional] 

### Return type

[**UserEntityDTOUpdateRequestResponse**](UserEntityDTOUpdateRequestResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserUpdatePasswordPut**
> UserEntityDTOUpdateRequestResponse apiUserUpdatePasswordPut(password)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final password = password_example; // String | 

try {
    final result = api_instance.apiUserUpdatePasswordPut(password);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserUpdatePasswordPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **password** | **String**|  | [optional] 

### Return type

[**UserEntityDTOUpdateRequestResponse**](UserEntityDTOUpdateRequestResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserUpdatePhoneNumberPut**
> UserEntityDTOUpdateRequestResponse apiUserUpdatePhoneNumberPut(phoneNumber)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final phoneNumber = phoneNumber_example; // String | 

try {
    final result = api_instance.apiUserUpdatePhoneNumberPut(phoneNumber);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserUpdatePhoneNumberPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **phoneNumber** | **String**|  | [optional] 

### Return type

[**UserEntityDTOUpdateRequestResponse**](UserEntityDTOUpdateRequestResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserUpdateUserPut**
> apiUserUpdateUserPut(id, updateUserEntityDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final id = 56; // int | 
final updateUserEntityDTO = UpdateUserEntityDTO(); // UpdateUserEntityDTO | 

try {
    api_instance.apiUserUpdateUserPut(id, updateUserEntityDTO);
} catch (e) {
    print('Exception when calling UserApi->apiUserUpdateUserPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 
 **updateUserEntityDTO** | [**UpdateUserEntityDTO**](UpdateUserEntityDTO.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserUpdateUsernamePut**
> UserEntityDTOUpdateRequestResponse apiUserUpdateUsernamePut(username)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final username = username_example; // String | 

try {
    final result = api_instance.apiUserUpdateUsernamePut(username);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserUpdateUsernamePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**|  | [optional] 

### Return type

[**UserEntityDTOUpdateRequestResponse**](UserEntityDTOUpdateRequestResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserUserByIdGet**
> UserEntityDTO apiUserUserByIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final id = 56; // int | 

try {
    final result = api_instance.apiUserUserByIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserUserByIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

[**UserEntityDTO**](UserEntityDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiUserUsersPaginatedGet**
> UserEntityDTOPaginatedResponse apiUserUsersPaginatedGet(currentPage, pageSize, id, countryId, cityId, isBanned, name, email, dayOfBirth, monthOfBirth, yearOfBirth, isAdmin, orderByAgeAsc, orderByCreationDateAsc)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = UserApi();
final currentPage = 56; // int | 
final pageSize = 56; // int | 
final id = 56; // int | 
final countryId = 56; // int | 
final cityId = 56; // int | 
final isBanned = true; // bool | 
final name = name_example; // String | 
final email = email_example; // String | 
final dayOfBirth = 56; // int | 
final monthOfBirth = 56; // int | 
final yearOfBirth = 56; // int | 
final isAdmin = true; // bool | 
final orderByAgeAsc = true; // bool | 
final orderByCreationDateAsc = true; // bool | 

try {
    final result = api_instance.apiUserUsersPaginatedGet(currentPage, pageSize, id, countryId, cityId, isBanned, name, email, dayOfBirth, monthOfBirth, yearOfBirth, isAdmin, orderByAgeAsc, orderByCreationDateAsc);
    print(result);
} catch (e) {
    print('Exception when calling UserApi->apiUserUsersPaginatedGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **currentPage** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 
 **id** | **int**|  | [optional] 
 **countryId** | **int**|  | [optional] 
 **cityId** | **int**|  | [optional] 
 **isBanned** | **bool**|  | [optional] 
 **name** | **String**|  | [optional] 
 **email** | **String**|  | [optional] 
 **dayOfBirth** | **int**|  | [optional] 
 **monthOfBirth** | **int**|  | [optional] 
 **yearOfBirth** | **int**|  | [optional] 
 **isAdmin** | **bool**|  | [optional] 
 **orderByAgeAsc** | **bool**|  | [optional] 
 **orderByCreationDateAsc** | **bool**|  | [optional] 

### Return type

[**UserEntityDTOPaginatedResponse**](UserEntityDTOPaginatedResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

