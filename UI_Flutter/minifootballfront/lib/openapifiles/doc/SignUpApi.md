# openapi.api.SignUpApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiSignUpCreatePlayerFromListPost**](SignUpApi.md#apisignupcreateplayerfromlistpost) | **POST** /api/SignUp/create-player-from-list | 
[**apiSignUpCreatePlayerPost**](SignUpApi.md#apisignupcreateplayerpost) | **POST** /api/SignUp/create-player | 


# **apiSignUpCreatePlayerFromListPost**
> List<CreateUserEntityDTO> apiSignUpCreatePlayerFromListPost(createUserEntityDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SignUpApi();
final createUserEntityDTO = [List<CreateUserEntityDTO>()]; // List<CreateUserEntityDTO> | 

try {
    final result = api_instance.apiSignUpCreatePlayerFromListPost(createUserEntityDTO);
    print(result);
} catch (e) {
    print('Exception when calling SignUpApi->apiSignUpCreatePlayerFromListPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createUserEntityDTO** | [**List<CreateUserEntityDTO>**](CreateUserEntityDTO.md)|  | [optional] 

### Return type

[**List<CreateUserEntityDTO>**](CreateUserEntityDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiSignUpCreatePlayerPost**
> CreateUserEntityDTO apiSignUpCreatePlayerPost(createUserEntityDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = SignUpApi();
final createUserEntityDTO = CreateUserEntityDTO(); // CreateUserEntityDTO | 

try {
    final result = api_instance.apiSignUpCreatePlayerPost(createUserEntityDTO);
    print(result);
} catch (e) {
    print('Exception when calling SignUpApi->apiSignUpCreatePlayerPost: $e\n');
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

