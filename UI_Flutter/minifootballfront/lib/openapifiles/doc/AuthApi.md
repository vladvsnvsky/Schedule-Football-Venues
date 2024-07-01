# openapi.api.AuthApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAuthAdminSignInPost**](AuthApi.md#apiauthadminsigninpost) | **POST** /api/Auth/admin-sign-in | 
[**apiAuthCheckByEmailPost**](AuthApi.md#apiauthcheckbyemailpost) | **POST** /api/Auth/check-by-email | 
[**apiAuthCreateFieldManagerPost**](AuthApi.md#apiauthcreatefieldmanagerpost) | **POST** /api/Auth/create-field-manager | 
[**apiAuthSetAdminPost**](AuthApi.md#apiauthsetadminpost) | **POST** /api/Auth/set-admin | 
[**apiAuthSignInPost**](AuthApi.md#apiauthsigninpost) | **POST** /api/Auth/sign-in | 
[**apiAuthSignUpPost**](AuthApi.md#apiauthsignuppost) | **POST** /api/Auth/sign-up | 


# **apiAuthAdminSignInPost**
> String apiAuthAdminSignInPost(userSignIn)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthApi();
final userSignIn = UserSignIn(); // UserSignIn | 

try {
    final result = api_instance.apiAuthAdminSignInPost(userSignIn);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->apiAuthAdminSignInPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userSignIn** | [**UserSignIn**](UserSignIn.md)|  | [optional] 

### Return type

**String**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAuthCheckByEmailPost**
> bool apiAuthCheckByEmailPost(emailRequestDio)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthApi();
final emailRequestDio = EmailRequestDio(); // EmailRequestDio | 

try {
    final result = api_instance.apiAuthCheckByEmailPost(emailRequestDio);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->apiAuthCheckByEmailPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailRequestDio** | [**EmailRequestDio**](EmailRequestDio.md)|  | [optional] 

### Return type

**bool**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAuthCreateFieldManagerPost**
> apiAuthCreateFieldManagerPost(body)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthApi();
final body = int(); // int | 

try {
    api_instance.apiAuthCreateFieldManagerPost(body);
} catch (e) {
    print('Exception when calling AuthApi->apiAuthCreateFieldManagerPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAuthSetAdminPost**
> apiAuthSetAdminPost(body)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthApi();
final body = int(); // int | 

try {
    api_instance.apiAuthSetAdminPost(body);
} catch (e) {
    print('Exception when calling AuthApi->apiAuthSetAdminPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAuthSignInPost**
> String apiAuthSignInPost(userSignIn)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthApi();
final userSignIn = UserSignIn(); // UserSignIn | 

try {
    final result = api_instance.apiAuthSignInPost(userSignIn);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->apiAuthSignInPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userSignIn** | [**UserSignIn**](UserSignIn.md)|  | [optional] 

### Return type

**String**

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAuthSignUpPost**
> CreateUserEntityDTO apiAuthSignUpPost(createUserEntityDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthApi();
final createUserEntityDTO = CreateUserEntityDTO(); // CreateUserEntityDTO | 

try {
    final result = api_instance.apiAuthSignUpPost(createUserEntityDTO);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->apiAuthSignUpPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createUserEntityDTO** | [**CreateUserEntityDTO**](CreateUserEntityDTO.md)|  | [optional] 

### Return type

[**CreateUserEntityDTO**](CreateUserEntityDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

